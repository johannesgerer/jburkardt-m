function tet_mesh_test003 ( )

%*****************************************************************************80
%
%% TET_MESH_TEST003 tests TETRAHEDRON_ORDER10_TO_ORDER4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2007
%
%  Author:
%
%    John Burkardt
%
  tet_order1 = 10;
  tet_order2 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_TEST003\n' );
  fprintf ( 1, '  For an order 10 tet mesh,\n' );
  fprintf ( 1, '  TETRAHEDRON_ORDER10_TO_ORDER4\n' );
  fprintf ( 1, '    makes a linear (order 4) tet mesh by using\n' );
  fprintf ( 1, '    the existing nodes, and replacing each\n' );
  fprintf ( 1, '    quadratic tetrahedron by 8 linear tetrahedrons.\n' );

  [ node_num1, tet_num1 ] = tet_mesh_order10_example_size ( );

  [ node_xyz, tet_node1 ] = tet_mesh_order10_example_set ( ...
    node_num1, tet_num1 );

  i4mat_transpose_print_some ( tet_order1, tet_num1, tet_node1, ...
    1, 1, tet_order1, 5, '  First 5 quadratic tetrahedrons:' );

  [ node_num2, tet_num2 ] = tet_mesh_order10_to_order4_size ( ...
    node_num1, tet_num1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadratic mesh size is       %d\n', tet_num1 );
  fprintf ( 1, '  Linearized mesh size will be %d\n', tet_num2 );

  tet_node2 = tet_mesh_order10_to_order4_compute ( tet_num1, ...
    tet_node1, tet_num2 );

  i4mat_transpose_print_some ( tet_order2, tet_num2, tet_node2, ...
    1, 1, tet_order2, 5, '  First 5 linear tetrahedrons:' );

  node_xyz = [];
  tet_node1 = [];
  tet_node2 = [];

  return
end
