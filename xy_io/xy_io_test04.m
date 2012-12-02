function xy_io_test04 ( )

%*****************************************************************************80
%
%% XY_IO_TEST04 tests XYL_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2009
%
%  Author:
%
%    John Burkardt
%
  xy_filename = 'house.xy';
  xyl_filename = 'house.xyl';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XY_IO_TEST04\n' );
  fprintf ( 1, '  XY_HEADER_READ  reads the header of an XY  file.\n' );
  fprintf ( 1, '  XY_DATA_READ    reads the data   of an XY  file.\n' );
  fprintf ( 1, '  XYL_HEADER_READ reads the header of an XYL file.\n' );
  fprintf ( 1, '  XYL_DATA_READ   reads the data   of an XYL file.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examine XY file "%s".\n', xy_filename );

  point_num = xy_header_read ( xy_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points     = %d\n', point_num );

  xy = xy_data_read ( xy_filename, point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Point data:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : point_num
    fprintf ( 1, '  %4d  %10f  %10f\n', i, xy(1:2,i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examine XYL file "%s".\n', xyl_filename );

  [ line_num, line_data_num ] = xyl_header_read ( xyl_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of lines      = %d\n', line_num );
  fprintf ( 1, '  Number of line items = %d\n', line_data_num );

  [ line_pointer, line_data ] = xyl_data_read ( xyl_filename, line_num, ...
    line_data_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line pointers:\n' );
  fprintf ( 1, '\n' );

  for line = 1 : line_num
    fprintf ( 1, '  %4d  %8d  %8d\n', line, line_pointer(line), ...
      line_pointer(line+1) - 1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line data:\n' );
  fprintf ( 1, '\n' );

  for line = 1 : line_num
    fprintf ( 1, '  %4d    ', line );
    for j = line_pointer(line) : line_pointer(line+1) - 1
      fprintf ( 1, '  %8d', line_data(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
