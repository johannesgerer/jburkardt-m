function disk_grid_test01 ( )

%*****************************************************************************80
%
%% DISK_GRID_TEST01 tests DISK_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  DISK_GRID can define a grid of points\n' );
  fprintf ( 1, '  with N+1 points on a horizontal or vertical radius,\n' );
  fprintf ( 1, '  based on any disk.\n' );

  n = 20;
  r = 2.0;
  c = [ 1.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use N = %d\n', n );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center C = (%f,%f)\n', c(1), c(2) );

  ng = disk_grid_count ( n, r, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of grid points will be %d\n', ng );

  cg = disk_grid ( n, r, c, ng );

  r82vec_print_part ( ng, cg, 20, '  Part of the grid point array:' );

  filename = 'disk_grid_test01.xy';

  r8mat_write ( filename, 2, ng, cg );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to the file "%s".\n', filename );
%
% Plot the points.
%
  i = 0 : 50;
  t = 2.0 * pi * i / 50.0;
  cx = c(1);
  cx = cx + r .* cos ( t );
  cy = c(2);
  cy = cy + r .* sin ( t );

  figure
  clf
  hold on
  plot ( cx, cy, 'r-', 'Linewidth', 3 )
  plot ( cg(1,1:ng), cg(2,1:ng), 'b.' )
  hold off
  axis equal
  xlabel ( '<---X--->', 'Fontsize', 16 )
  ylabel ( '<---Y--->', 'Fontsize', 16 )
  title ( sprintf ( 'Circle grid with %d points', ng ), 'Fontsize', 16 );
  filename = 'disk_grid_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics data saved in file "%s"\n', filename );

  return
end
