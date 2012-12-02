function grid_test ( code )

%*****************************************************************************80
%
%% GRID_TEST tests the grid routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, the code for the element.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T4', 'T6' and 'T10'.
%

%
%  NODE is defined as a vector rather than a two dimensional array,
%  so that we can handle the various cases using a single array.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  GRID_TEST: Test the grid routine for element "%s"\n', code );

  nelemx = 3;
  nelemy = 2;

  fprintf ( 1, '  Number of elements in X direction = %d\n', nelemx );
  fprintf ( 1, '  Number of elements in Y direction = %d\n', nelemy );

  element_order = order_code ( code );

  node_num = grid_node_num ( code, nelemx, nelemy );

  fprintf ( 1, '  Element order =       %d\n', element_order );
  fprintf ( 1, '  Nodes in grid =       %d\n', node_num );

  element_num = grid_element_num ( code, nelemx, nelemy );

  element_node = grid_element ( code, element_order, nelemx, nelemy );

  grid_print ( element_order, element_num, element_node );

  width = grid_width ( element_order, element_num, element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid width is %d\n', width );

  return
end
