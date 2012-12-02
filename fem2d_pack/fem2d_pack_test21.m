function fem2d_pack_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests SPHERE_GRID_Q16.
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
  element_order = 16;
  nelemx = 2;
  nelemy = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  SPHERE_GRID_Q16_ELEMENT sets up a grid of\n' );
  fprintf ( 1, '    Q16 quadrilaterals on a sphere.\n' );
  fprintf ( 1, '  SPHERE_GRID_Q16_ELEMENT_NUM returns the number\n' );
  fprintf ( 1, '    of elements in the grid\n' );
  fprintf ( 1, '  SPHERE_GRID_Q16_NODE_NUM returns the number\n' );
  fprintf ( 1, '    of nodes in the grid.\n' );
  fprintf ( 1, '  SPHERE_GRID_Q16_NODE_XYZ returns the coordinates\n' );
  fprintf ( 1, '    of nodes in the grid.\n' );

  element_num = sphere_grid_q16_element_num ( nelemx, nelemy );
  node_num = sphere_grid_q16_node_num ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected number of nodes =    %d\n', node_num );
  fprintf ( 1, '  Expected number of elements = %d\n', element_num );

  element_node = sphere_grid_q16_element ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The elements and their nodes, listed in a way\n' );
  fprintf ( 1, '  that suggests their geometry:\n' );
  fprintf ( 1, '\n' );

  element = element_num;

  for j = 1 : nelemy
    for i = 1 : nelemx
      fprintf ( 1, '\n' );
      fprintf ( 1, '%4d  %4d%4d%4d%4d\n', element, element_node(13:16,element) );
      fprintf ( 1, '      %4d%4d%4d%4d\n',         element_node(9:12,element) );
      fprintf ( 1, '      %4d%4d%4d%4d\n',         element_node(5:8,element) );
      fprintf ( 1, '      %4d%4d%4d%4d\n',         element_node(1:4,element) );
      element = element - 1;
    end
  end

  node_xyz = sphere_grid_q16_node_xyz ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The node coordinates:\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num
    fprintf ( 1, '  %4d  %12f  %12f  %12f\n', node, node_xyz(1:3,node) );
  end
%
%  Write the elements and nodes to files.
%
  r8mat_write ( 'sphere_q16_nodes.txt', 3, node_num, node_xyz );

  i4mat_write ( 'sphere_q16_elements.txt', element_order, element_num, ...
    element_node );

  return
end
