function xyf_write ( output_filename, point_num, face_num, face_data_num, ...
  face_pointer, face_data )

%*****************************************************************************80
%
%% XYF_WRITE writes an XYF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the name of the file
%    to which the data should be written.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
%    Input, integer FACE_POINTER(FACE_NUM+1), pointers to the
%    first face item for each face.
%
%    Input, integer FACE_DATA(FACE_DATA_NUM), indices
%    of points that form faces.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYF_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_filename );
    error ( 'XYF_WRITE - Error!' );
  end
%
%  Write the header.
%
  xyf_header_write ( output_filename, output_unit, point_num, face_num, ...
    face_data_num );
%
%  Write the data.
%
  xyf_data_write ( output_unit, point_num, face_num, face_data_num, ...
    face_pointer, face_data );
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
