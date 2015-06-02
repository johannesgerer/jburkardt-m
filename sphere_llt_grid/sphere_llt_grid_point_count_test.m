function sphere_llt_grid_point_count_test ( )

%*****************************************************************************80
%
%% SPHERE_LLT_GRID_POINT_COUNT_TEST tests SPHERE_LLT_GRID_POINT_COUNT.
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
  lat_num = 3;
  long_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LLT_GRID_POINT_COUNT_TEST\n' );
  fprintf ( 1, '  SPHERE_LLT_GRID_POINT_COUNT counts the points used for a\n' );
  fprintf ( 1, '  grid based on triangles defined by latitude and longitude\n' );
  fprintf ( 1, '  lines on a sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     LAT_NUM    LONG_NUM   POINT_NUM\n' );
  for lat_num = 1 : 2 : 17
    fprintf ( 1, '\n' );
    long_num = 1;
    for long_log = 1 : 4
      long_num = long_num * 2;
      point_num = sphere_llt_grid_point_count ( lat_num, long_num );
      fprintf ( 1, '  %8d  %8d  %8d\n', lat_num, long_num, point_num );
    end
  end

  return
end
