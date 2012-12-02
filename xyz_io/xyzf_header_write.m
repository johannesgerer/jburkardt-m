function xyzf_header_write ( output_filename, output_unit, point_num, ...
  face_num, face_data_num )

%*****************************************************************************80
%
%% XYZF_HEADER_WRITE writes the header of an XYL file.
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
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the name of the output file.
%
%    Input, integer OUTPUT_UNIT, the output file unit number.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
  fprintf ( output_unit, '#  %s\n', output_filename );
  fprintf ( output_unit, '#  created by xyz_io::xyzf_header_write.m\n' );
  fprintf ( output_unit, '#\n');
  fprintf ( output_unit, '#  Number of points =     %d\n', point_num );
  fprintf ( output_unit, '#  Number of faces =      %d\n', face_num );
  fprintf ( output_unit, '#  Number of face items = %d\n', face_data_num );
  fprintf ( output_unit, '#\n' );

  return
end
