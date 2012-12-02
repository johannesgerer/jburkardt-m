function xyzf_data_write ( output_unit, point_num, face_num, face_data_num, ...
  face_pointer, face_data )

%*****************************************************************************80
%
%% XYZF_DATA_WRITE writes the data of an XYZF file.
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
%    Input, integer OUTPUT_UNIT, the output file unit number.
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
  for face = 1 : face_num
    for i = face_pointer(face) : face_pointer(face+1) - 1
      fprintf ( output_unit, '  %d', face_data(i) );
    end
    fprintf ( output_unit, '\n' );
  end

  return
end
