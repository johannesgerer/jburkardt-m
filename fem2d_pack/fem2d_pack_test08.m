function fem2d_pack_test08 ( )

%*****************************************************************************80
%
%% TEST08 demonstrates ELEMENTS_EPS with T3 elements.
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
  nelemx = 7;
  nelemy = 5;

  element_num = grid_t3_element_num ( nelemx, nelemy );
  node_num = grid_t3_node_num ( nelemx, nelemy );

  code = 'T3';
  file_name = 'fem2d_pack_test_t3.eps';
  title = 'Grid of T3 Elements';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  ELEMENTS_EPS creates an Encapsulated PostScript\n' );
  fprintf ( 1, '  file containing an image of a T3 mesh.\n' );

  element_node = grid_t3_element ( nelemx, nelemy );

  node = 0;

  for row = 0 : nelemy

    r = ( ( nelemy - row ) *  1.0   ...
        + (        + row ) *  3.0 ) ...
        /   nelemy;

    for col = 0 : nelemx

      node = node + 1;
      angle = ( ( nelemx - col ) * 135.0   ...
              + (        + col ) *  45.0 ) ...
              /   nelemx;

      angle = degrees_to_radians ( angle );

      node_x(node) = r * cos ( angle );
      node_y(node) = r * sin ( angle );

    end

  end

  for element = 1 : element_num
    element_mask(element) = 1;
  end

  elements_eps ( file_name, node_num, node_x, node_y, code, ...
    element_order, element_num, element_mask, element_node, title );

  return
end
