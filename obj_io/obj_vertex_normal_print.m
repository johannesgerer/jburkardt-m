function obj_vertex_normal_print ( order_max, face_num, face_order, ...
  vertex_normal )

%*****************************************************************************80
%
%% OBJ_VERTEX_NORMAL_PRINT prints the normal vectors indices per vertex.
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
%    Input, integer NORMAL_NUM, the number of normal vectors.
%
%    Input, integer VERTEX_NORMAL(ORDER_MAX,FACE_NUM), the normal vectors.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normal Vector Indices:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Face   Order\n' );
  fprintf ( 1, '\n' );

  for face = 1 : face_num

    fprintf ( 1, '  %8d  %8d', face, face_order(face) );

    for i = 1 : face_order(face)
      fprintf ( 1, '  %8d', vertex_normal(i,face) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
