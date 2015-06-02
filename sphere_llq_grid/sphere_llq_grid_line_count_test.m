function sphere_llq_grid_line_count_test ( )

%*****************************************************************************80
%
%% SPHERE_LLQ_GRID_LINE_COUNT_TEST tests SPHERE_LLQ_GRID_LINE_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2015
%
%  Author:
%
%    John Burkardt
%
  lat_num = 3;
  long_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LLQ_GRID_LINE_COUNT_TEST\n' );
  fprintf ( 1, '  SPHERE_LLQ_GRID_LINE_COUNT counts the lines used for a\n' );
  fprintf ( 1, '  grid based on quadrilaterals defined by latitude and longitude\n' );
  fprintf ( 1, '  lines on a sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     LAT_NUM    LONG_NUM   LINE_NUM\n' );
  for lat_num = 1 : 2 : 17
    fprintf ( 1, '\n' );
    long_num = 1;
    for long_log = 1 : 4
      long_num = long_num * 2;
      line_num = sphere_llq_grid_line_count ( lat_num, long_num );
      fprintf ( 1, '  %8d  %8d  %8d\n', lat_num, long_num, line_num );
    end
  end

  return
end
