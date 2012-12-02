function [ element_area, mesh_area ] = area_q4_mesh ( node_num, element_num, ...
  node_xy, element_node )

%*****************************************************************************80
%
%% AREA_Q4_MESH computes areas of elements in a Q4 mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, real NODE_XY(2,NODE_NUM), the node coordinates.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), lists the
%    nodes that make up each element, in counterclockwise order.
%
%    Output, real ELEMENT_AREA(ELEMENT_NUM), the element areas.
%
%    Output, real MESH_AREA, the mesh area.
%
  for element = 1 : element_num
    for node = 1 : 4
      q4(1:2,node) = node_xy(1:2,element_node(node,element));
    end
    element_area(element) = area_quad ( q4 );
  end

  mesh_area = sum ( element_area(1:element_num) );

  return
end
