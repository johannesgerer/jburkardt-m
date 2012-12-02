function xyzf_data_print ( point_num, face_num, face_data_num, ...
  face_pointer, face_data )

%*****************************************************************************80
%
%% XYZF_DATA_PRINT prints the data of an XYZF file.
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
  fprintf ( 1, '\n' );
  for face = 1 : face_num
    fprintf ( 1, '  %4d  %8d  %8d\n', ...
      face, face_pointer(face) : face_pointer(face+1) - 1 );
  end

  fprintf ( 1, '\n' );
  for face = 1 : face_num
    for i = face_pointer(face) : face_pointer(face+1) - 1
      fprintf ( 1, '  %d', face_data(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
