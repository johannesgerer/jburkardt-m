function test01 ( prefix )

%*****************************************************************************80
%
%% TEST01 tests XY_TO_DIST_TABLE.
%
%  Discussion:
%
%    Get the XY coordinates of a set of cities, and compute
%    the city-to-city distance table.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 September 009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string PREFIX, the common file prefix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01'
  fprintf ( 1, '  POINT_TO_DIST_TABLE computes a distance table from a'
  fprintf ( 1, '  list of point locations.'

  main_filename = sprintf ( '%s_main.txt', prefix );
  point_filename = sprintf ( '%s_points.txt', prefix );
  dist_table_filename = sprintf ( '%s_dist_table.txt', prefix );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The main filename is "%s".\n', main_filename );
  fprintf ( 1, '  The point filename is "%s".\n', point_filename );
  fprintf ( 1, '  The distance table filename will be "%s".\n', dist_table_filename );

  [ dim_num, point_num ] = r8mat_header_read ( point_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension is ', dim_num
  fprintf ( 1, '  The number of points is  ', point_num

  point = r8mat_data_read ( point_file, dim_num, point_num );

  r8mat_transpose_print ( dim_num, point_num, point, '  The points:' );

  dist_table = point_to_dist_table ( dim_num, point_num, point );

  dist_table(1:n,1:n) = round ( dist_table(1:n,1:n) );

  r8mat_print_some ( point_num, point_num, dist_table, 1, 1, 5, 5, ...
    '  Initial 5x5 distance subtable:' );

  r8mat_write ( dist_table_filename, point_num, point_num, dist_table );

  return
end
