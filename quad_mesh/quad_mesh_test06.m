function quad_mesh_test06 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST06 tests EXAMPLE1_Q4_MESH.
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
  fprintf ( 1, 'QUAD_MESH_TEST06\n' );
  fprintf ( 1, '  EXAMPLE1_Q4_MESH sets up example #1 Q4 mesh.\n' );

  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes =    %d\n', node_num );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Number of holes =    %d\n', hole_num );

  [ node_xy, element_node, element_neighbor ] = example1_q4_mesh ( ...
    node_num, element_num );

  r8mat_transpose_print ( 2, node_num, node_xy, '  Node coordinates:' );
  i4mat_transpose_print ( 4, element_num, element_node, '  Elements:' );
  i4mat_transpose_print ( 4, element_num, element_neighbor, ...
    '  Element neighbors' );

  return
end
