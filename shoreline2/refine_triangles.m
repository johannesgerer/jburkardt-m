function [ node_xy2, triangle_node2 ] = ...
  refine_triangles ( node_num1, triangle_num1, node_xy1, ...
  triangle_node1, node_num2, triangle_num2, edge_data )

%*****************************************************************************80
%
%% REFINE_TRIANGLES computes a refined order 3 triangulation.
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
%    Input, integer TRIANGLE_NODE1(3,TRIANGLE_NUM1), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Input, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge information computed
%    by TRIANGULATION_ORDER3_REFINE_SIZE.
%
%    Output, real NODE_XY2(2,NODE_NUM2), the refined nodes.
%
%    Output, integer TRIANGLE_NODE2(3,TRIANGLE_NUM2), the nodes that make up the
%    triangles in the refined mesh.
%
  node_xy2 = zeros(2,node_num2);
  triangle_node2 = zeros(3,triangle_num2);
%
%  Copy the old nodes.
%
  node_xy2(1:2,1:node_num1) = node_xy1(1:2,1:node_num1);

  triangle_node2(1:3,1:triangle_num2) = -1;
%
%  We can assign the existing nodes to the new triangles.
%
  for triangle1 = 1 : triangle_num1
    triangle_node2(1,(triangle1-1)*4+1) = triangle_node1(1,triangle1);
    triangle_node2(2,(triangle1-1)*4+2) = triangle_node1(2,triangle1);
    triangle_node2(3,(triangle1-1)*4+3) = triangle_node1(3,triangle1);
  end

  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1

    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
%
%  If this edge is new, create the coordinates and index for this node.
%
    if ( n1 ~= n1_old || n2 ~= n2_old )

      node = node + 1;

      if ( node_num2 < node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'REFINE_TRIANGLES - Fatal error!\n' );
        fprintf ( 1, '  Node index exceeds NODE_NUM2.\n' );
        error ( 'REFINE_TRIANGLES - Fatal error!' );
      end

      node_xy2(1:2,node) = ( node_xy2(1:2,n1) + node_xy2(1:2,n2) ) / 2.0;

      n1_old = n1;
      n2_old = n2;

    end
%
%  Assign the node to triangles.
%
    v1 = edge_data(3,edge);
    v2 = edge_data(4,edge);
    triangle1 = edge_data(5,edge);

    if ( v1 == 1 && v2 == 2 )

      triangle_node2(1,(triangle1-1)*4+2) = node;
      triangle_node2(2,(triangle1-1)*4+1) = node;
      triangle_node2(3,(triangle1-1)*4+4) = node;

    elseif ( v1 == 1 && v2 == 3 )

      triangle_node2(1,(triangle1-1)*4+3) = node;
      triangle_node2(2,(triangle1-1)*4+4) = node;
      triangle_node2(3,(triangle1-1)*4+1) = node;

    elseif ( v1 == 2 && v2 == 3 ) 

      triangle_node2(1,(triangle1-1)*4+4) = node;
      triangle_node2(2,(triangle1-1)*4+3) = node;
      triangle_node2(3,(triangle1-1)*4+2) = node;

    end

  end

  return
end
