function width = grid_width ( element_order, element_num, element_node )

%*****************************************************************************80
%
%% GRID_WIDTH computes the width of a given grid.
%
%  Definition:
%
%    The grid width is defined to the maximum absolute
%    difference of global indices of nodes in the same element.
%
%  Example:
%
%    For the following grid, the grid width is 13.
%
%   23---24---25---26---27---28---29
%    |         |         |         |
%    |         |         |         |
%   19        20        21        22
%    |         |         |         |
%    | 4       | 5       | 6       |
%   12---13---14---15---16---17---18
%    |         |         |         |
%    |         |         |         |
%    8         9        10        11
%    |         |         |         |
%    | 1       | 2       | 3       |
%    1----2----3----4----5----6----7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
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
%    Output, integer WIDTH, the grid width.
%
  width = 0;

  for element = 1 : element_num
    for node1 = 1 : element_order
      ip1 = element_node(node1,element);
      for node2 = 1 : element_order
        ip2 = element_node(node2,element);
        width = max ( width, abs ( ip1 - ip2 ) );
      end
    end
  end

  return
end
