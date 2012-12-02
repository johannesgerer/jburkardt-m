function xyz_io_test05 ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST05 tests XYZF_EXAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2009
%
%  Author:
%
%    John Burkardt
%
  xyz_filename = 'cube.xyz';
  xyzf_filename = 'cube.xyzf';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZ_IO_TEST05\n' );
  fprintf ( 1, '  XYZF_EXAMPLE sets up XYZ and XYZF data.\n' );

  [ point_num, face_num, face_data_num ] = xyzf_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Example has:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points     = %d\n', point_num );
  fprintf ( 1, '  Number of faces      = %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  [ xyz, face_pointer, face_data ] = xyzf_example ( point_num, face_num, ...
    face_data_num );

  xyz_write ( xyz_filename, point_num, xyz );

  xyzf_write ( xyzf_filename, point_num, face_num, face_data_num, ...
    face_pointer, face_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the XYZ file "%s".\n', xyz_filename );
  fprintf ( 1, '  and the XYZF file "%s".\n', xyzf_filename );

  return
end
