function sphere_cubed_grid_points_display_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_POINTS_DISPLAY_TEST tests SPHERE_CUBED_GRID_POINTS_DISPLAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_POINTS_DISPLAY_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_POINTS_DISPLAY_TEST displays points\n' );
  fprintf ( 1, '  on a cubed sphere grid.\n' );

  n = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of divisions on each face = %d\n', n );

  ns = sphere_cubed_grid_point_count ( n );
  fprintf ( 1, '  Total number of points = %d\n', ns );

  xyz = sphere_cubed_grid_points ( n, ns );

  filename = sprintf ( 'sphere_cubed_grid_points_f%d.png', n );

  sphere_cubed_grid_points_display ( ns, xyz, filename );

  return
end
