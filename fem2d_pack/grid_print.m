function grid_print ( element_order, element_num, element_node )

%*****************************************************************************80
%
%% GRID_PRINT prints the elements that form a grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the nodes that form
%    each element.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  GRID_PRINT: Element -> Node table.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element order = %d\n', element_order );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  #   ' );
  for i = 1 : element_order
    fprintf ( 1, '%3d', i );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );

  for element = 1 : element_num
    fprintf ( 1, '  %3d   ', element );
    for i = 1 : element_order
      fprintf ( 1, '%3d', element_node(i,element) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
