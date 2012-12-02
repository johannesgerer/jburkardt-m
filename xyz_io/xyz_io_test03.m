function xyz_io_test03 ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST03 tests XYZL_EXAMPLE.
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
  fprintf ( 1, 'XYZ_IO_TEST03\n' );
  fprintf ( 1, '  XYZL_EXAMPLE sets up XYZ and XYZL data.\n' );

  [ point_num, line_num, line_data_num ] = xyzl_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Example has:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points     = %d\n', point_num );
  fprintf ( 1, '  Number of lines      = %d\n', line_num );
  fprintf ( 1, '  Number of line items = %d\n', line_data_num );

  [ xyz, line_pointer, line_data ] = xyzl_example ( point_num, line_num, ...
    line_data_num );

  xyz_write ( xyz_filename, point_num, xyz );

  xyzl_write ( xyzl_filename, point_num, line_num, line_data_num, ...
    line_pointer, line_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the XYZ file "%s".\n', xyz_filename );
  fprintf ( 1, '  and the XYZL file "%s".\n', xyzl_filename );

  return
end
