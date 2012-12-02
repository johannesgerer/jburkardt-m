function [ p, t ] = cvt_circle_nonuniform ( n, sample_num, delaunay_display )

%*****************************************************************************80
%
%% CVT_CIRCLE_NONUNIFORM demonstrates how a CVT can be computed and displayed in MATLAB.
%
%  Discussion:
%
%    This simple example carries out an iterative CVT calculation in a circle
%    with a nonuniform sampling density. 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Qiang Du, Vance Faber, Max Gunzburger,
%    Centroidal Voronoi Tessellations: Applications and Algorithms,
%    SIAM Review, 
%    Volume 41, 1999, pages 637-676.
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, logical DELAUNAY_DISPLAY, is TRUE (nonzero) if the Delaunay
%    triangulation is to be displayed.
%
%    Output, real P(2,N), the location of the generators.
%
%    Output, integer T(NT,3), information defining the Delaunay
%    triangulation of the generators.  NT is the number of triangles,
%    which varies depending on the arrangement of the generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_CIRCLE_NONUNIFORM:\n' );
  fprintf ( 1, '  A simple demonstration of a CVT computation\n' );
  fprintf ( 1, '  (Centroidal Voronoi Tessellation)\n' );
  fprintf ( 1, '  in a circle, with a nonuniform density.\n' );
  
  if ( nargin < 1 )
    n = 100;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_CIRCLE_NONUNIFORM - Note:\n' );
    fprintf ( 1, '  No value of N was supplied.\n' );
    fprintf ( 1, '  N is the number of generators.\n' );
    fprintf ( 1, '  A default value N = %d will be used.\n', n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User specified number of generators = %d\n',  n );
  end

  if ( nargin < 2 )
    sample_num = 10000 * n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_CIRCLE_NONUNIFORM - Note:\n' );
    fprintf ( 1, '  No value of SAMPLE_NUM was supplied.\n' );
    fprintf ( 1, '  SAMPLE_NUM is the number of sample points.\n' );
    fprintf ( 1, '  A default value SAMPLE_NUM = %d will be used.\n', ...
      sample_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User specified number of sample points = %d\n', ...
      sample_num );
  end

  if ( nargin < 3 )
    delaunay_display = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_CIRCLE_NONUNIFORM - Note:\n' );
    fprintf ( 1, '  No value of DELAUNAY_DISPLAY was supplied.\n' );
    fprintf ( 1, '  DELAUNAY_DISPLAY is TRUE (nonzero) if the\n' );
    fprintf ( 1, '  Delaunay triangulation is also to be displayed.\n' );
    fprintf ( 1, '  A default value DELAUNAY_DISPLAY = %d will be used.\n', ...
      delaunay_display );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User specified DELAUNAY_DISPLAY = %d\n', ...
      delaunay_display );
  end
%
%  This switch is set to 1 (TRUE) if the ACCUMARRAY command is available.
%  That speeds up the calculation a lot.  If you don't have the ACCUMARRAY
%  command, just set this to 0.
% 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_CIRCLE_NONUNIFORM:\n' );
  fprintf ( 1, '  MATLAB''s ACCUMARRAY command can be used for faster\n' );
  fprintf ( 1, '  computation.  This command is not available in\n' );
  fprintf ( 1, '  some versions of MATLAB.  If ACCUMARRAY is available,\n' );
  fprintf ( 1, '  simply make sure that the ACCUMARAY_AVAILABLE variable\n' );
  fprintf ( 1, '  is set to 1!\n' );
  
  accumarray_available = 1;

  if ( accumarray_available )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  CVT_CIRCLE_NONUNIFORM will use the ACCUMARRAY command.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      '  CVT_CIRCLE_NONUNIFORM will NOT use the ACCUMARRAY command.\n' );
  end
%
%  Clear the figure screen, if already open.
%
  clf
%
%  Initialize the generators.
%
  p(1:2,1:n) = circle_nonuniform ( n );
  
  it = 0;
  
  while ( 1 )
%
%  Compute the Delaunay triangle information T for the current nodes.
%
    t = delaunay ( p(1,:), p(2,:) );
%
%  Display the Delaunay triangulation, if requested.
%
    if ( delaunay_display )
      subplot ( 1, 2, 2 )
      trimesh ( t, p(1,:), p(2,:), zeros(n,1) )
      axis ( [ -1.1, 1.1, -1.1, 1.1 ] )
      title_string = sprintf ( 'Delaunay, step %d', it );
      title ( title_string );
      axis equal
      view ( 2 )
    end
%
%  Display the CVT generators, and the associated Voronoi diagram.
%
    if ( delaunay_display )
      subplot ( 1, 2, 1 )
    end

    for i = 1 : 51
      theta = 2 * pi * i / 50;
      x(i) = cos ( theta );
      y(i) = sin ( theta );
    end

    voronoi ( p(1,:), p(2,:), t );
    hold on
    line ( x, y );
    axis ( [ -1.1, 1.1, -1.1, 1.1 ] )
    title_string = sprintf ( 'Nonuniform Density on a Circle, CVT step %d', it );
    title ( title_string );
    axis equal
    drawnow
    hold off
%
%  Generate sample points.  
%  
    ps(1:2,1:sample_num) = circle_nonuniform ( sample_num );
%
%  For each sample point, find K, the index of the nearest generator.
%  We do this efficiently by using the Delaunay information with
%  Matlab's DSEARCH command, rather than a brute force nearest neighbor
%  computation.
%  
    k(1:sample_num,1) = dsearch ( p(1,:), p(2,:), t, ps(1,:), ps(2,:) );
%
%  The centroid of the Voronoi region associated with each generator
%  is approximated by the average of the sample points it was closest to.
%
    if ( accumarray_available )

      count(1:n) = accumarray ( k, ones(sample_num,1) );
      centroid(1,1:n) = accumarray ( k, ps(1,:) );
      centroid(2,1:n) = accumarray ( k, ps(2,:) );

    else

      count(1:n) = 0;
      centroid(1,1:n) = 0.0;
      centroid(2,1:n) = 0.0;

      for i = 1 : sample_num
        j = k(i);
        count(j) = count(j) + 1;
        centroid(1,j) = centroid(1,j) + ps(1,i);
        centroid(2,j) = centroid(2,j) + ps(2,i);
      end

    end
%
%  Replace the generators by the centroids.
%
    p(1,1:n) = ( centroid(1,1:n) ./ count(1:n) )';
    p(2,1:n) = ( centroid(2,1:n) ./ count(1:n) )';

    string = input ( 'RETURN, or Q to quit: ', 's' );

    if ( string == 'q' | string == 'Q' )
      break
    end

    it = it + 1;
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_CIRCLE_NONUNIFORM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function p = circle_nonuniform ( n )

%*****************************************************************************80
%
%% CIRCLE_NONUNIFORM returns sample points from a circle.
%
%  Discussion:
%
%    This routine returns N points sampled nonuniformly at random
%    from within the unit circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to generate.
%
%    Output, real P(2,N), the sample points.
%

%
%  Step 1: Generate N points in the unit circle.
%  (Generate N normally distributed points.
%   Normalize them (now they lie on the circumference).
%   Assign a radius.)
%
  p(1:2,1:n) = randn(2,n);

  p_norm(1:n) = sqrt ( dot ( p, p, 1 ) );

  r(1:n) = rand(1,n);

  for i = 1 : 2
    p(i,1:n) = sqrt ( sqrt ( r(1:n) ) ) .* p(i,1:n) ./ p_norm(1:n);
  end

  return
end
