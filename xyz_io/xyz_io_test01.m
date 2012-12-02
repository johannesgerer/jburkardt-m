function xyz_io_test01 ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST01 tests XYZ_EXAMPLE, XYZ_WRITE.
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
  file_name = 'helix.xyz';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZ_IO_TEST01\n' );
  fprintf ( 1, '  XYZ_EXAMPLE sets up sample XYZ data.\n' );
  fprintf ( 1, '  XYZ_WRITE writes an XYZ file.\n' );

  point_num = xyz_example_size ( );

  fprintf ( 1, '  Example dataset size is %d\n', point_num );

  xyz = xyz_example ( point_num );

  xyz_write ( file_name, point_num, xyz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XYZ_WRITE wrote the header and data for "%s".\n', ...
    file_name );
  fprintf ( 1, '  Number of points = %d\n', point_num );

  return
end
