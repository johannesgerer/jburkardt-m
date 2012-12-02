function fem2d_pack_test09 ( )

%*****************************************************************************80
%
%% TEST09 demonstrates ELEMENTS_EPS with T4 elements.
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
  nelemx = 7;
  nelemy = 5;

  element_num = grid_t4_element_num ( nelemx, nelemy );
  node_num = grid_t4_node_num ( nelemx, nelemy );

  code = 'T4';
  file_name = 'fem2d_pack_test_t4.eps';
  title = 'Grid of T4 Elements';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  ELEMENTS_EPS creates an Encapsulated PostScript\n' );
  fprintf ( 1, '  file containing an image of a T4 mesh.\n' );

  element_node = grid_t4_element ( nelemx, nelemy );

  node = 0;

  for row = 0 : nelemy

    y = ( ( 3*nelemy - row ) *  0.0   ...
        + (          + row ) *  6.0 ) ...
        / ( 3*nelemy       );

    for col = 0 : nelemx

      node = node + 1;

      x = ( ( 2*nelemx - col ) * 0.0   ...
          + (          + col ) * 6.0 ) ...
          / ( 2*nelemx       );

      node_x(node) = x;
      node_y(node) = y;

    end
%
%  Skip over the two rows of interior nodes.
%
    node = node + nelemx;
    node = node + nelemx;

  end
%
%  The coordinates of interior nodes are the average of the vertices.
%
  for element = 1 : element_num
    node = element_node(4,element);
    node_x(node) = sum ( node_x(element_node(1:3,element)) ) / 3.0;
    node_y(node) = sum ( node_y(element_node(1:3,element)) ) / 3.0;
  end

  for element = 1 : element_num
    element_mask(element) = 1;
  end

  elements_eps ( file_name, node_num, node_x, node_y, code, ...
    element_order, element_num, element_mask, element_node, title );

  return
end
