function disk_grid_test02 ( )

%*****************************************************************************80
%
%% DISK_GRID_TEST02 tests DISK_GRID_FIBONACCI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  DISK_GRID_FIBONACCI can define a grid of N points\n' );
  fprintf ( 1, '  \n' );

  n = 1000;
  r = 2.0;
  c = [ 1.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use N = %d\n', n );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center C = (%f,%f)\n', c(1), c(2) );

  g = disk_grid_fibonacci ( n, r, c );

  r82vec_print_part ( n, g, 20, '  Part of the grid point array:' );

  filename = 'disk_grid_test02.xy';

  r8mat_write ( filename, 2, n, g );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gridpoint coordinate data saved in file "%s".\n', filename );
%
% Plot the points.
%
  i = 0 : 50;
  t = 2.0 * pi * i / 50.0;
  cx = c(1);
  cx = cx + r .* cos ( t );
  cy = c(2);
  cy = cy + r .* sin ( t );

  figure ( )
  clf
  hold on
  plot ( cx, cy, 'r-', 'Linewidth', 3 )
  plot ( g(1,1:n), g(2,1:n), 'b.' )
  hold off
  axis equal
  xlabel ( '<---X--->', 'Fontsize', 16 )
  ylabel ( '<---Y--->', 'Fontsize', 16 )
  title ( sprintf ( 'Fibonacci grid with %d points', n ), 'Fontsize', 16 );
  filename = 'disk_grid_test02.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics data saved in file "%s"\n', filename );

  return
end
