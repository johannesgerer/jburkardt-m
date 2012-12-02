function [ triangle_area, triangulation_area ] = triangulation_areas ( ...
  node_num, node_xy, triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_AREAS computes triangle and triangulation areas.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the
%    triangulation.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer TRIANGLE_ORDER, the order of triangles in
%    the triangulation.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in
%    the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the nodes making up each triangle.
%
%    Output, real TRIANGLE_AREA(TRIANGLE_NUM), the area of
%    the triangles.
%
%    Output, real TRIANGULATION_AREA, the area of
%    the triangulation.
%
  triangulation_area = 0.0;

  for triangle = 1 : triangle_num

    triangle_xy(1:2,1:3) = node_xy(1:2,triangle_node(1:3,triangle));

    triangle_area(triangle) = triangle_area_2d ( triangle_xy );

    triangulation_area = triangulation_area + triangle_area(triangle);

  end

  return
end
