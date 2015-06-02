function sphere_cubed_grid_lines_display_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_LINES_DISPLAY_TEST tests SPHERE_CUBED_GRID_LINES_DISPLAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2015
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_LINES_DISPLAY_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_LINES_DISPLAY displays the lines\n' );
  fprintf ( 1, '  on a cubed sphere grid.\n' );
  fprintf ( 1, '  Each cube face is divided into %dx%d subfaces\n', n, n  );

  point_num = sphere_cubed_grid_point_count ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of points is %d\n', point_num );

  xyz = sphere_cubed_grid_points ( n, point_num );

  line_num = sphere_cubed_grid_line_count ( n );

  fprintf ( 1, '  The number of grid lines is %d\n', line_num );

  line_data = sphere_cubed_grid_lines ( n, line_num );

  filename = 'sphere_cubed_grid_lines.png';

  sphere_cubed_grid_lines_display ( point_num, xyz, line_num, line_data, filename );

  return
end
