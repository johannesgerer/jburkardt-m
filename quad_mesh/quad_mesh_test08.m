function quad_mesh_test08 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST08 tests NEIGHBOR_ELEMENTS_Q4_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST08\n' );
  fprintf ( 1, '  NEIGHBOR_ELEMENTS_Q4_MESH determines the\n' );
  fprintf ( 1, '  adjacency relationships between elements.\n' );

  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example1_q4_mesh ( node_num, ...
    element_num );

  i4mat_transpose_print ( 4, element_num, element_neighbor, ...
    '  Element neighbors as reported by EXAMPLE1_Q4_MESH:' );

  element_neighbor2 = neighbor_elements_q4_mesh ( element_num, element_node );

  i4mat_transpose_print ( 4, element_num, element_neighbor2, ...
    '  Element neighbors computed by NEIGHBOR_ELEMENTS_Q4_MESH:' );

  return
end
