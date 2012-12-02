function obj_io_test02 ( input_file_name )

%*****************************************************************************80
%
%% TEST02 tests OBJ_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  OBJ_READ reads an object in an OBJ file.\n' );

  [ node_num, face_num, normal_num, order_max ] = obj_size ( input_file_name );

  [ node_xyz, face_order, face_node, normal_vector, vertex_normal ] = ...
    obj_read ( input_file_name, node_num, face_num, normal_num, order_max );

  obj_face_node_print ( face_num, order_max, face_order, face_node );
  obj_normal_vector_print ( normal_num, normal_vector );
  obj_node_xyz_print ( node_num, node_xyz );

  return
end
