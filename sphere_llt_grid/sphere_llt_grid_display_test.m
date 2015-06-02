function sphere_llt_grid_display_test ( )

%*****************************************************************************80
%
%% SPHERE_LLT_GRID_DISPLAY_TEST tests SPHERE_LLT_GRID_DISPLAY.
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
  lat_num = 10;
  long_num = 12;
  pc(1,1:3) = [ 0.0, 0.0, 0.0 ];
  r = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LLT_GRID_DISPLAY_TEST\n' );
  fprintf ( 1, '  SPHERE_LLT_GRID_DISPLAY displays an LLT grid on a sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of latitudes is  %d\n', lat_num );
  fprintf ( 1, '  Number of longitudes is %d\n', long_num );
%
%  Get points.
%
  node_num = sphere_llt_grid_point_count ( lat_num, long_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of grid points is %d\n', node_num );

  node_xyz = sphere_llt_grid_points ( r, pc, lat_num, long_num, node_num );
%
%  Get lines.
%
  line_num = sphere_llt_grid_line_count ( lat_num, long_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of line segments is %d\n', line_num );

  line_data = sphere_llt_grid_lines ( lat_num, long_num, line_num );

  filename = 'sphere_llt_grid.png';

  sphere_llt_grid_display ( r, pc, lat_num, long_num, node_num, node_xyz, line_num, ...
    line_data, filename );

  return
end
