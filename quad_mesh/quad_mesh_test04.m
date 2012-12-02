function quad_mesh_test04 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST04 tests BOUNDARY_EDGE_COUNT_Q4_MESH.
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
  fprintf ( 1, 'QUAD_MESH_TEST04\n' );
  fprintf ( 1, '  BOUNDARY_EDGE_COUNT_Q4_MESH counts the\n' );
  fprintf ( 1, '  boundary edges by looking at the mesh\n' );
  fprintf ( 1, '  and counting unpaired edges.\n' );
%
%  The value of HOLE_NUM, which is supplied by this call, is not
%  needed for this calculation.
%
  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example1_q4_mesh ( ...
    node_num, element_num );

  boundary_edge_num = boundary_edge_count_q4_mesh ( element_num, ...
    element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of boundary edges = %d\n', boundary_edge_num );
  fprintf ( 1, '  Correct number =           %d\n', 22 );

  return
end
