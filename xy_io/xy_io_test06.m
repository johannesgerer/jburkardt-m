function xy_io_test06 ( )

%*****************************************************************************80
%
%% XY_IO_TEST06 tests XYF_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2009
%
%  Author:
%
%    John Burkardt
%
  xy_filename = 'annulus.xy';
  xyf_filename = 'annulus.xyf';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XY_IO_TEST06\n' );
  fprintf ( 1, '  XY_HEADER_READ  reads the header of an XY  file.\n' );
  fprintf ( 1, '  XY_DATA_READ    reads the data   of an XY  file.\n' );
  fprintf ( 1, '  XYF_HEADER_READ reads the header of an XYF file.\n' );
  fprintf ( 1, '  XYF_DATA_READ   reads the data   of an XYF file.\n' );

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
  fprintf ( 1, '  Examine XYF file "%s".\n', xyf_filename );

  [ face_num, face_data_num ] = xyf_header_read ( xyf_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of faces      = %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  [ face_pointer, face_data ] = xyf_data_read ( xyf_filename, face_num, ...
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
