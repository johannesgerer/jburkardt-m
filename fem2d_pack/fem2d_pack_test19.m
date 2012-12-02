function fem2d_pack_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests SPHERE_GRID_Q4.
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
  element_order = 4;
  nelemx = 8;
  nelemy = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  SPHERE_GRID_Q4_ELEMENT sets up a grid of\n' );
  fprintf ( 1, '    Q4 quadrilaterals on a sphere.\n' );
  fprintf ( 1, '  SPHERE_GRID_Q4_ELEMENT_NUM returns the number\n' );
  fprintf ( 1, '    of elements in the grid\n' );
  fprintf ( 1, '  SPHERE_GRID_Q4_NODE_NUM returns the number\n' );
  fprintf ( 1, '    of nodes in the grid.\n' );
  fprintf ( 1, '  SPHERE_GRID_Q4_NODE_XYZ returns the coordinates\n' );
  fprintf ( 1, '    of nodes in the grid.\n' );

  element_num = sphere_grid_q4_element_num ( nelemx, nelemy );
  node_num = sphere_grid_q4_node_num ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected number of nodes =    %d\n', node_num );
  fprintf ( 1, '  Expected number of elements = %d\n', element_num );

  element_node = sphere_grid_q4_element ( nelemx, nelemy );

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

  node_xyz = sphere_grid_q4_node_xyz ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The node coordinates:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %4d  %12f  %12f  %12f\n', node, node_xyz(1:3,node) );
  end
%
%  Write the elements and nodes to files.
%
  r8mat_write ( 'sphere_q4_nodes.txt', 3, node_num, node_xyz );

  i4mat_write ( 'sphere_q4_elements.txt', element_order, element_num, ...
    element_node );

  return
end
