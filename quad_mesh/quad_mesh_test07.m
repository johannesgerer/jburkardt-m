function quad_mesh_test07 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST07 tests EXAMPLE2_Q4_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST07\n' );
  fprintf ( 1, '  EXAMPLE1_Q4_MESH sets up example #2 Q4 mesh.\n' );

  [ node_num, element_num, hole_num ] = example2_q4_mesh_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes =    %d\n', node_num );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Number of holes =    %d\n', hole_num );

  [ node_xy, element_node, element_neighbor ] = example2_q4_mesh ( ...
    node_num, element_num );

  r8mat_transpose_print ( 2, node_num, node_xy, '  Node coordinates:' );
  i4mat_transpose_print ( 4, element_num, element_node, '  Elements:' );
  i4mat_transpose_print ( 4, element_num, element_neighbor, ...
    '  Element neighbors' );

  return
end
