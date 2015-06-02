function sphere_fibonacci_grid_display ( ng, xg, filename )

%*****************************************************************************80
%
%% SPHERE_FIBONACCI_GRID_DISPLAY displays a Fibonacci grid on a sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NG, the number of grid points.
%
%    Input, real XG(NG,3), the coordinates of the grid points.
%
  figure ( )
  clf
  hold on
  [ x, y, z ] = sphere ( 20 );
  x = 0.95 * x;
  y = 0.95 * y;
  z = 0.95 * z;
  c = ones ( size ( z ) );
  surf ( x, y, z, c );
  plot3 ( xg(:,1), xg(:,2), xg(:,3), 'b.', 'Markersize', 20 );
  axis equal
  grid on
  view ( 3 )
  xlabel ( '<--X-->' )
  ylabel ( '<--Y-->' )
  zlabel ( '<--Z-->' )
  title ( sprintf ( '%d point Fibonacci Grid on Sphere', ng ), 'FontSize', 24 );
  hold off

  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved to "%s".\n', filename );

  return
end
