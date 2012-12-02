function value = triangulation_area ( node_num, node_xy, element_order, ...
  element_num, element_node )

%*****************************************************************************80
%
%% TRIANGULATION_AREA computes the area of a triangulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer ELEMENT_ORDER, the order of the triangles.
%
%    Input, integer ELEMENT_NUM, the number of triangles.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM),
%    the nodes making up each triangle.
%
%    Output, real VALUE, the area.
%
  value = 0.0;

  for element = 1 : element_num

    element_xy(1:2,1:3) = node_xy(1:2,element_node(1:3,element));

    element_area = 0.5 * abs ( ...
        element_xy(1,1) * ( element_xy(2,2) - element_xy(2,3) ) ...
      + element_xy(1,2) * ( element_xy(2,3) - element_xy(2,1) ) ...
      + element_xy(1,3) * ( element_xy(2,1) - element_xy(2,2) ) );

    value = value + element_area;

  end

  return
end
