function obj_face_node_print ( face_num, order_max, face_order, face_node )

%*****************************************************************************80
%
%% OBJ_FACE_NODE_PRINT prints the node indices for each face.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer ORDER_MAX, the maximum number of vertices per face.
%
%    Input, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Input, integer FACE_NODE(ORDER_MAX,FACE_NUM), the nodes that make
%    up each face.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Face   Order      Nodes\n' );
  fprintf ( 1, '\n' );

  for face = 1 : face_num

    order = face_order(face);

    fprintf ( 1, '  %8d  %8d', face, order );
    for i = 1 : order
      fprintf ( 1, '  %8d', face_node(i,face) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
