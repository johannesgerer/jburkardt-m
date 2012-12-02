function xyz_io_test06 ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST06 tests XYZF_READ.
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
  fprintf ( 1, 'XYZ_IO_TEST06\n' );
  fprintf ( 1, '  XYZ_HEADER_READ  reads the header of an XYZ  file.\n' );
  fprintf ( 1, '  XYZ_DATA_READ    reads the data   of an XYZ  file.\n' );
  fprintf ( 1, '  XYZF_HEADER_READ reads the header of an XYZF file.\n' );
  fprintf ( 1, '  XYZF_DATA_READ   reads the data   of an XYZF file.\n' );

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
  fprintf ( 1, '  Examine XYZF file "%s".\n', xyzf_filename );

  [ face_num, face_data_num ] = xyzf_header_read ( xyzf_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of faces      = %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  [ face_pointer, face_data ] = xyzf_data_read ( xyzf_filename, face_num, ...
    face_data_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Face pointers:\n' );
  fprintf ( 1, '\n' );

  for face = 1 : face_num
    fprintf ( 1, '  %4d  %8d  %8d\n', face, face_pointer(face), ...
      face_pointer(face+1) - 1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Face data:\n' );
  fprintf ( 1, '\n' );

  for face = 1 : face_num
    fprintf ( 1, '  %4d    ', face );
    for j = face_pointer(face) : face_pointer(face+1) - 1
      fprintf ( 1, '  %8d', face_data(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
