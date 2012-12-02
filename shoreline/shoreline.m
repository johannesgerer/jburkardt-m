function [ x, t ] = shoreline ( f, m, n, x_min, x_max, y_min, y_max, step_num )

%*****************************************************************************80
%
%% SHORELINE approximates a region for which a function is positive.
%
%  Discussion:
%
%    The user defines a rectangular region to be searched, an initial
%    grid of points, and a function F(X,Y).
%
%    The region of interest is the set of points for which 0 <= F(X,Y).
%
%    The function triangulates the initial set of points, keeps the triangles
%    for which all three vertices have nonnegative F values, discards those
%    triangles with all negative F values, and subdivides the triangles having
%    both positive and negative F values.
%
%    The subdivision process can be repeated as desired.  Each subdivision
%    produces an improved estimate of the extent of the positive region.
%
%    The program outputs the nodes and triangles of the triangulation
%    of the region comprising those triangles with at least one positive
%    vertex.
%    
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real F(N,X), the handle of a MATLAB M-file to evaluate the function.
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
%    Local real FX(X_NUM), the function value at the nodes.
%
%    Local, integer T_NUM, the number of triangles.
%
%    Local, integer X_NUM, the number of nodes.
%
  if ( nargin < 1 )
    f = @camel;
  end

  if ( nargin < 2 )
    m = 20;
  end

  if ( nargin < 3 )
    n = m;
  end
%
%  Select the starting points and triangulate them.
%
  x = product_grid ( m, x_min, x_max, n, y_min, y_max );
  [ x_num, two ] = size ( x );
  fx = f ( x_num, x );

  dt = DelaunayTri ( x(:,1), x(:,2) );
  t = dt.Triangulation;
  [ t_num, three ] = size ( t );

  area = triangulation_area ( x_num, x, 3, t_num, t );
  fprintf ( 1, '  Number of triangles = %d, Area = %f\n', t_num, area );

  step = 0;

  while ( 1 )

    step = step + 1;
%
%  Drop the completely negative triangles.
%
    [ x_num, x, fx, t_num, t ] = cull_negative_triangles ( x_num, ...
      x, fx, t_num, t );
%
%  Display the current triangulation.
%
    if ( 0 )
      clf
      hold on
      c = fx;
      i = find ( fx <= 0 );
      c(i) = 0;
      j = find ( 0 <= fx );
      c(j) = 1;
      triplot ( t, x(:,1), x(:,2) )
      plot ( [ x_min, x_max ], [y_min, y_max ], 'ko' );
      plot ( x(i,1), x(i,2), 'r.', 'MarkerSize', 10 );
      plot ( x(j,1), x(j,2), 'b.', 'MarkerSize', 20 ); 
      title ( sprintf ( 'Triangulation on step %d', step ) )
      axis ( [ x_min, x_max, y_min, y_max ] );
      axis square
      grid
      hold off
      pause
    end
%
%  Split triangles into positive and equivocal.
%
    t_area = triangulation_area ( x_num, x, 3, t_num, t );

    i = all ( 0 <= fx(t)' );
    tp = t(i,:);
    [ tp_num, three ] = size ( tp );
    tp_area = triangulation_area ( x_num, x, 3, tp_num, tp );

    j = any ( fx(t)' < 0 );
    te = t(j,:);
    [ te_num, three ] = size ( te );
    te_area = t_area - tp_area;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Triangles        Area\n' );
    fprintf ( 1, '   %8d  %14f (positive)\n',          tp_num, tp_area );
    fprintf ( 1, '   %8d  %14f (mixed)\n',             te_num, te_area );
    fprintf ( 1, '   %8d  %14f (positive+mixed)\n',    t_num,  t_area );

    if ( step_num <= step )
      break
    end
%
%  Refine the mixed region, containing "equivocal" triangles.
%
    [ x2_num, te2_num, edge_data ] = refine_size ( x_num, te_num, te );
 
    [ x2, te2 ] = refine_compute ( x_num, te_num, x, te, x2_num, te2_num, ...
      edge_data );

    x = x2;
    x_num = x2_num;
    t = [ tp; te2 ];
    [ t_num, three ] = size ( t );
    fx = f ( x_num, x );

  end
%
%  Rearrange T and X to have the fixed dimension first.
%
  t = t';
  x = x';

  return
end


