function xy_io_test05 ( )

%*****************************************************************************80
%
%% XY_IO_TEST05 tests XYF_EXAMPLE.
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
  fprintf ( 1, 'XY_IO_TEST05\n' );
  fprintf ( 1, '  XYF_EXAMPLE sets up XY and XYF data.\n' );

  [ point_num, face_num, face_data_num ] = xyf_example_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Example has:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points     = %d\n', point_num );
  fprintf ( 1, '  Number of faces      = %d\n', face_num );
  fprintf ( 1, '  Number of face items = %d\n', face_data_num );

  [ xy, face_pointer, face_data ] = xyf_example ( point_num, face_num, ...
    face_data_num );

  xy_write ( xy_filename, point_num, xy );

  xyf_write ( xyf_filename, point_num, face_num, face_data_num, ...
    face_pointer, face_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the XY file "%s".\n', xy_filename );
  fprintf ( 1, '  and the XYF file "%s"\n', xyf_filename ) ;

  return
end
