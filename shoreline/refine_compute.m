function [ node_xy2, triangle_node2 ] = refine_compute ( node_num1, ...
  triangle_num1, node_xy1, triangle_node1, node_num2, triangle_num2, edge_data )

%*****************************************************************************80
%
%% REFINE_COMPUTE computes a refined order 3 triangulation.
%
%  Discussion:
%
%    Given a triangle defined by nodes 1, 2, 3, we need to generate
%    nodes 12, 23, and 13, and create 4 new subtriangles, T1, T2, T3
%    and T4.
%
%    The task is more complicated by the fact that we are working with
%    a mesh of triangles, so that we want to create a node only once,
%    even though it may be shared by other triangles.
%
%          3
%         / \
%        /T3 \
%      13----23
%      / \T4 / \
%     /T1 \ /T2 \
%    1----12-----2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM1, the number of nodes.
%
%    Input, integer TRIANGLE_NUM1, the number of triangles.
%
%    Input, real NODE_XY1(2,NODE_NUM1), the nodes.
%
%    Input, integer TRIANGLE_NODE1(TRIANGLE_NUM1,3), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Input, integer EDGE_DATA(3*TRIANGLE_NUM1,5), edge information computed
%    by TRIANGULATION_ORDER3_REFINE_SIZE.
%
%    Output, real NODE_XY2(NODE_NUM2,2), the refined nodes.
%
%    Output, integer TRIANGLE_NODE2(TRIANGLE_NUM2,3), the nodes that make up the
%    triangles in the refined mesh.
%
  node_xy2 = zeros(node_num2,2);
  triangle_node2 = zeros(triangle_num2,3);
%
%  Copy the old nodes.
%
  node_xy2(1:node_num1,1:2) = node_xy1(1:node_num1,1:2);

  triangle_node2(1:triangle_num2,1:3) = -1;
%
%  We can assign the existing nodes to the new triangles.
%
  for triangle1 = 1 : triangle_num1
    triangle_node2((triangle1-1)*4+1,1) = triangle_node1(triangle1,1);
    triangle_node2((triangle1-1)*4+2,2) = triangle_node1(triangle1,2);
    triangle_node2((triangle1-1)*4+3,3) = triangle_node1(triangle1,3);
  end

  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1

    n1 = edge_data(edge,1);
    n2 = edge_data(edge,2);
%
%  If this edge is new, create the coordinates and index for this node.
%
    if ( n1 ~= n1_old || n2 ~= n2_old )

      node = node + 1;

      node_xy2(node,1:2) = ( node_xy2(n1,1:2) + node_xy2(n2,1:2) ) / 2.0;

      n1_old = n1;
      n2_old = n2;

    end
%
%  Assign the node to triangles.
%
    v1 = edge_data(edge,3);
    v2 = edge_data(edge,4);
    triangle1 = edge_data(edge,5);

    if ( v1 == 1 && v2 == 2 )

      triangle_node2((triangle1-1)*4+2,1) = node;
      triangle_node2((triangle1-1)*4+1,2) = node;
      triangle_node2((triangle1-1)*4+4,3) = node;

    elseif ( v1 == 1 && v2 == 3 )

      triangle_node2((triangle1-1)*4+3,1) = node;
      triangle_node2((triangle1-1)*4+4,2) = node;
      triangle_node2((triangle1-1)*4+1,3) = node;

    elseif ( v1 == 2 && v2 == 3 ) 

      triangle_node2((triangle1-1)*4+4,1) = node;
      triangle_node2((triangle1-1)*4+3,2) = node;
      triangle_node2((triangle1-1)*4+2,3) = node;

    end

  end

  return
end
