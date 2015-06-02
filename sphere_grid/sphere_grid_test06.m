function sphere_grid_test06 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST06 tests SPHERE_LL_LINES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2012
%
%  Author:
%
%    John Burkardt
%
  lat_num = 3;
  long_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST06\n' );
  fprintf ( 1, '  SPHERE_LL_LINES computes gridlines\n' );
  fprintf ( 1, '  on a sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of latitudes is  %d\n', lat_num );
  fprintf ( 1, '  Number of longitudes is %d\n', long_num );

  line_num = sphere_ll_line_num ( lat_num, long_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of line segments is %d\n', line_num );

  line = sphere_ll_lines ( lat_num, long_num, line_num );

  i4mat_transpose_print ( 2, line_num, line, '  Grid line vertices:' );

  return
end
