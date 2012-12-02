function stla_face_normal_print ( face_num, face_normal )

%*****************************************************************************80
%
%% STLA_FACE_NORMAL_PRINT prints the normal vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, real FACE_NORMAL(3,FACE_NUM), the normal vector at each face.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Face         Normal Vectors\n' );
  fprintf ( 1, '\n' );

  for face = 1, face_num

    fprintf ( 1, '  %6d  %14f  %14f  %14f\n', face, face_normal(1:3,face) );

  end

  return
end
