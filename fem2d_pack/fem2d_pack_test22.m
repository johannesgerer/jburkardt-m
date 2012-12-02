function fem2d_pack_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests SPHERE_GRID_T3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  element_order = 3;
  nelemx = 8;
  nelemy = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  SPHERE_GRID_T3_ELEMENT sets up a grid of T3 triangles\n' );
  fprintf ( 1, '    on a sphere.\n' );
  fprintf ( 1, '  SPHERE_GRID_T3_ELEMENT_NUM returns the number\n' );
  fprintf ( 1, '    of elements in the grid\n' );
  fprintf ( 1, '  SPHERE_GRID_T3_NODE_NUM returns the number\n' );
  fprintf ( 1, '    of nodes in the grid.\n' );
  fprintf ( 1, '  SPHERE_GRID_T3_NODE_XYZ returns the coordinates\n' );
  fprintf ( 1, '    of nodes in the grid.\n' );

  element_num = sphere_grid_t3_element_num ( nelemx, nelemy );
  node_num = sphere_grid_t3_node_num ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected number of nodes =    %d\n', node_num );
  fprintf ( 1, '  Expected number of elements = %d\n', element_num );

  element_node = sphere_grid_t3_element ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The elements and their nodes:\n' );
  fprintf ( 1, '\n' );

  for element = 1 : element_num
    fprintf ( 1, '%4d  ', element );
    for order = 1 : element_order
      fprintf ( 1, '%4d', element_node(order,element) );
    end
    fprintf ( 1, '\n' );
  end

  node_xyz = sphere_grid_t3_node_xyz ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The node coordinates:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %4d  %12f  %12f  %12f\n', node, node_xyz(1:3,node) );
  end
%
%  Write the elements and nodes to files.
%
  r8mat_write ( 'sphere_t3_nodes.txt', 3, node_num, node_xyz );

  i4mat_write ( 'sphere_t3_elements.txt', element_order, element_num, ...
    element_node );

  return
end
