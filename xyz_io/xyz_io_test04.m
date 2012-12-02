function xyz_io_test04 ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST04 tests XYZL_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2009
%
%  Author:
%
%    John Burkardt
%
  xyz_filename = 'cube.xyz';
  xyzl_filename = 'cube.xyzl';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZ_IO_TEST04\n' );
  fprintf ( 1, '  XYZ_HEADER_READ  reads the header of an XYZ  file.\n' );
  fprintf ( 1, '  XYZ_DATA_READ    reads the data   of an XYZ  file.\n' );
  fprintf ( 1, '  XYZL_HEADER_READ reads the header of an XYZL file.\n' );
  fprintf ( 1, '  XYZL_DATA_READ   reads the data   of an XYZL file.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examine XYZ file "%s".\n', xyz_filename );

  point_num = xyz_header_read ( xyz_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points = %d\n', point_num );

  xyz = xyz_data_read ( xyz_filename, point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Point data:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : point_num
    fprintf ( 1, '  %4d  %10f  %10f  %10f\n', i, xyz(1:3,i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Examine XYZL file "%s".\n', xyzl_filename );

  [ line_num, line_data_num ] = xyzl_header_read ( xyzl_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of lines      = %d\n', line_num );
  fprintf ( 1, '  Number of line items = %d\n', line_data_num );

  [ line_pointer, line_data ] = xyzl_data_read ( xyzl_filename, line_num, ...
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
