function mandelbrot ( m, n, count_max )

%*****************************************************************************80
%
%% MANDELBROT computes an image of the Mandelbrot set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of pixels in the X direction.
%
%    Input, integer N, the number of pixels in the Y direction.
%
%    Input, integer COUNT_MAX, the number of iterations.  While 10 or
%    20 is a reasonable value, increasing COUNT_MAX gives a sharper image.
%
  if ( nargin == 0 )
    m = 101;
  end

  if ( nargin <= 1 )
    n = m;
  end

  if ( nargin <= 2 )
    count_max = 20;
  end

  x_max =   1.25;
  x_min = - 2.25;
  y_max =   1.75;
  y_min = - 1.75;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MANDELBROT\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Create an image of the Mandelbrot set.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For each point C = X + i*Y\n' );
  fprintf ( 1, '  with X range [%f,%f]\n', x_min, x_max );
  fprintf ( 1, '  and  Y range [%f,%f]\n', y_min, y_max );
  fprintf ( 1, '  carry out %f iterations of the map\n', count_max );
  fprintf ( 1, '  Z(n+1) = Z(n)^2 + C.\n' );
  fprintf ( 1, '  If the iterates stay bounded\n' );
  fprintf ( 1, '  then C is taken to be a member of the set.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  An image of the set is created using\n' );
  fprintf ( 1, '    M = %d pixels in the X direction and\n', m );
  fprintf ( 1, '    N = %d pixels in the Y direction.\n', n );
  fprintf ( 1, '    COUNT_MAX = %d = number of iterations.\n', count_max );
%
%  Create an array of complex sample points in [x_min,x_max] + [y_min,y_max]*i.
%
  I = ( 1 : m );
  J = ( 1 : n );
  X = ( ( I - 1 ) * x_max + ( m - I ) * x_min ) / ( m - 1 );
  Y = ( ( J - 1 ) * y_max + ( n - J ) * y_min ) / ( n - 1 );
  [ Zr, Zi ] = meshgrid ( X, Y );
  C = complex ( Zr, Zi );
%
%  Carry out the iteration.
%
  epsilon = 0.001;

  Z = C;
  ieps = 1 : numel ( C );

  for i = 1 : count_max
    Z(ieps) = Z(ieps) .* Z(ieps) + C(ieps);
    W(ieps) = exp ( - abs ( Z(ieps) ) );
    ieps = ieps ( find ( epsilon < W(ieps) ) );
  end
%
%  Display the data.
%
  d = log ( abs ( Z ) );
  t = delaunay ( Zr, Zi );
%
%  To see individual pixels, use 'flat' color.
%
% h = trisurf ( t, Zr, Zi, d, 'FaceColor', 'flat', 'EdgeColor', 'flat' );
%
  h = trisurf ( t, Zr, Zi, d, 'FaceColor', 'interp', 'EdgeColor', 'interp' );

  view ( 2 )
  axis equal
  axis off
  title_string = sprintf ( 'Mandelbrot set, %d x %d pixels, %d iterations', ...
    m, n, count_max );
  title ( title_string )
  xlabel ( '- X Axis -' );
  ylabel ( '- Y Axis -' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MANDELBROT\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
