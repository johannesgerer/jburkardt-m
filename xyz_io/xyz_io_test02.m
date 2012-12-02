function xyz_io_test02 ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST02 tests XYZ_HEADER_READ, XYZ_DATA_READ.
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
  file_name = 'xyz_io_prb_02.xyz';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZ_IO_TEST02\n' );
  fprintf ( 1, '  XYZ_HEADER_READ reads the header of an XYZ file.\n' );
  fprintf ( 1, '  XYZ_DATA_READ reads the data of an XYZ file.\n' );

  xyz_write_test ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XYZ_WRITE_TEST created some data.\n' );

  point_num = xyz_header_read ( file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XYZ_HEADER_READ has read the header.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points = %d\n', point_num );

  xyz = xyz_data_read ( file_name, point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XYZ_DATA_READ has read the data.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample data:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 11
    i = floor ( ( ( 11 - k     ) * 1 ...
                + (      k - 1 ) * point_num ) ...
                / ( 11     - 1 ) );
    fprintf ( 1, '  %4d  %10f  %10f  %10f\n', i, xyz(1:3,i) );
  end

  return
end
