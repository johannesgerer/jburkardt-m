function stla_face_node_print ( face_num, face_node )

%*****************************************************************************80
%
%% STLA_FACE_NODE_PRINT prints the node indices for each face.
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
%    Input, integer FACE_NODE(3,FACE_NUM), the nodes that make up each face.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Face         Nodes\n' );
  fprintf ( 1, '\n' );

  for face = 1 : face_num

    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', face, face_node(1:3,face) );

  end

  return
end
