function [ x, t ] = shoreline2 ( f, f_contour, m, n, x_min, x_max, y_min, ...
  y_max, step_num )

%*****************************************************************************80
%
%% SHORELINE2 approximates the region where a function changes sign.
%
%  Discussion:
%
%    The user defines a rectangular region to be searched, an initial
%    grid of points, a function F(X,Y), and a contour level C.
%
%    The region of interest is the set of points for which F(X,Y) = C.
%
%    We will seek to approximate this set of points by a set of triangles
%    with the property that, for each triangle, at least one vertex has
%    a positive value of F(X,Y)-C and one a negative value.
%
%    The function triangulates an initial set of points, keeps the "change
%    of sign" triangles and discards the rest.  
%
%    The remaining triangles may be subdivided, the function evaluated on
%    the added points, and the disposable triangles removed.
%    The subdivision process can be repeated as desired.  Each subdivision
%    produces an improved estimate of the shape of change of sign region.
%
%    The program outputs the nodes and triangles of the triangulation
%    of the region comprising the change of sign triangles.
%    
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real F(N,X), the handle of a MATLAB M-file to evaluate the function.
%
%    Input, real F_CONTOUR, the contour level.
%
%    Input, integer M, N, the number of grid points in the X and Y directions.
%
%    Input, real X_MIN, X_MAX, Y_MIN, Y_MAX, the limits of the region.
%
%    Input, integer STEP_NUM, the number of steps to take.
%
%    Output, real X(2,X_NUM), the nodes of the triangulation.
%
%    Output, real T(3,T_NUM), the triangles of the triangulation.
%
%  Local Parameters:
%
%    Local real FX(1,X_NUM), the function value at the nodes.
%
%    Local, integer T_NUM, the number of triangles.
%
%    Local, integer X_NUM, the number of nodes.
%
  if ( nargin < 1 )
    f = @camel;
  end

  if ( nargin < 2 )
    f_contour = 0.5;
  end

  if ( nargin < 3 )
    m = 10;
  end

  if ( nargin < 4 )
    n = m;
  end

  if ( nargin < 5 )
    x_min = - 2.5;
  end

  if ( nargin < 6 )
    x_max = +2.5;
  end

  if ( nargin < 7 )
    y_min = - 2.5;
  end

  if ( nargin < 8 )
    y_max = +2.5;
  end

  if ( nargin < 9 )
    step_num = 2;
  end
%
%  Select the starting points.
%  Transpose product_grid's output.
%
  x = product_grid ( m, x_min, x_max, n, y_min, y_max );
  x = x';
  [ two, x_num ] = size ( x );
%
%  Evaluate the function at the initial points.
%
  fx = f ( x_num, x ) - f_contour;
%
%  Triangulate the points.
%  Transpose DelaunayTri's output.
%
  dt = DelaunayTri ( x(1,:)', x(2,:)' );
  t = dt.Triangulation;
  t = t';
  [ three, t_num ] = size ( t );
%
%  Iterate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step  Nodes  Triangles    Area\n' );
  fprintf ( 1, '\n' );

  step = 0;
  area = triangulation_area ( x_num, x, t_num, t );

  fprintf ( 1, '  %4d  %5d  %9d   %f\n', step, x_num, t_num, area );

  while ( 1 )

    step = step + 1;
%
%  Drop the "pure" triangles.
%
    [ x_num, x, fx, t_num, t ] = cull_pure_triangles ( x_num, x, fx, t_num, t );
%
%  Report.
%
    area = triangulation_area ( x_num, x, t_num, t );

    fprintf ( 1, '  %4d  %5d  %9d   %f\n', step, x_num, t_num, area );
%
%  Display the current triangulation.
%
    if ( 1 )
      h = trimesh ( t', x(1,:), x(2,:) );
      set ( h, 'color', 'k' )
      grid on
      axis equal
      s = sprintf ( 'F(x,y) = %g on step %d.', f_contour, step );
      title ( s );
      pause
    end
%
%  Termination?
%
    if ( step_num <= step )
      break
    end
%
%  Size the refined grid.
%
    [ x2_num, t2_num, edge_data ] = refine_size ( x_num, t_num, t );
%
%  Refine the grid.
%
    [ x, t ] = refine_triangles ( x_num, t_num, x, t, x2_num, t2_num, edge_data );
%
%  Update the counts, and the function array.
%
    x_num = x2_num;
    t_num = t2_num;
    fx = f ( x_num, x ) - f_contour;

  end

  return
end


