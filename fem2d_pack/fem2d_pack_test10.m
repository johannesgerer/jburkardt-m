function fem2d_pack_test10 ( )

%*****************************************************************************80
%
%% TEST10 demonstrates ELEMENTS_EPS with T6 elements.
%
%  Discussion:
%
%    We generate a big grid of T6 elements, but we only want to
%    look at the six elements shared by node 85.
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
  element_order = 6;
  nelemx = 6;
  nelemy = 6;

  element_num = grid_t6_element_num ( nelemx, nelemy );
  node_num = grid_t6_node_num ( nelemx, nelemy );

  code = 'T6';
  file_name = 'fem2d_pack_test_t6.eps';
  title = 'Grid of T6 Elements';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  ELEMENTS_EPS creates an Encapsulated PostScript\n' );
  fprintf ( 1, '  file containing an image of a T6 mesh.\n' );

  element_node = grid_t6_element ( nelemx, nelemy );

  node = 0;

  for row = 0 : 2 * nelemy

    y = ( ( 2 * nelemy - row ) * 0.0   ...
        + (            + row ) * 6.0 ) ...
        / ( 2 * nelemy );

    for col = 0 : 2 * nelemx

      node = node + 1;
      x = ( ( 2 * nelemx - col ) * 0.0   ...
          + (            + col ) * 6.0 ) ...
          / ( 2 * nelemx );

      node_x(node) = x;
      node_y(node) = y;

    end

  end

  for element = 1: element_num
    element_mask(element) = 0;
  end

  element_mask(30) = 1;
  element_mask(31) = 1;
  element_mask(32) = 1;
  element_mask(41) = 1;
  element_mask(42) = 1;
  element_mask(43) = 1;

  elements_eps ( file_name, node_num, node_x, node_y, code, ...
    element_order, element_num, element_mask, element_node, title );

  return
end
