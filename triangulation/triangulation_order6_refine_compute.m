function [ node_xy2, triangle_node2 ] = ...
  triangulation_order6_refine_compute ( node_num1, triangle_num1, node_xy1, ...
  triangle_node1, node_num2, triangle_num2, edge_data )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_REFINE_COMPUTE computes a refined order 6 triangulation.
%
%  Discussion:
%
%    Given a quadratic triangle defined by nodes 1, 2, 3, 4, 5, 6, we
%    need to generate nodes 14, 16, 24, 25, 35, 36, 45, 46, 56, and 4 new
%    quadratic subtriangles T1, T2, T3 and T4.
%
%    The task is more complicated by the fact that we are working with
%    a mesh of triangles, so that we want to create a node only once,
%    even though it may be shared by other triangles.  (In fact, only
%    the new nodes on the edges can be shared, and then only by at most
%    one other triangle.)
%
%            3
%           / \
%          36 35
%         / T3  \
%        6--56---5
%       / \ T4  / \
%      16 46  45  25
%     / T1  \ / T2  \
%    1--14---4--24---2
%
%    This routine is given sorted information defining the edges, and uses
%    it to build the new node and triangle arrays.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2007
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
%    Input, integer TRIANGLE_NODE1(6,TRIANGLE_NUM1), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Input, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge data.
%
%    Output, real NODE_XY2(2,NODE_NUM2), the refined nodes.
%
%    Output, integer TRIANGLE_NODE2(6,TRIANGLE_NUM2), the nodes that make up the
%    triangles in the refined mesh.
%

%
%  Step 1:
%  Copy old nodes.
%
  node_xy2(1:2,1:node_num1) = node_xy1(1:2,1:node_num1);
%
%  Copy indices of existing nodes into new triangle array.
%
  triangle_node2(1:6,1:triangle_num2) = -1;

  for triangle1 = 1 : triangle_num1

    t1 = ( triangle1 - 1 ) * 4 + 1;
    t2 = ( triangle1 - 1 ) * 4 + 2;
    t3 = ( triangle1 - 1 ) * 4 + 3;
    t4 = ( triangle1 - 1 ) * 4 + 4;

    triangle_node2(1,t1) = triangle_node1(1,triangle1);
    triangle_node2(2,t1) = triangle_node1(4,triangle1);
    triangle_node2(3,t1) = triangle_node1(6,triangle1);

    triangle_node2(1,t2) = triangle_node1(4,triangle1);
    triangle_node2(2,t2) = triangle_node1(2,triangle1);
    triangle_node2(3,t2) = triangle_node1(5,triangle1);

    triangle_node2(1,t3) = triangle_node1(6,triangle1);
    triangle_node2(2,t3) = triangle_node1(5,triangle1);
    triangle_node2(3,t3) = triangle_node1(3,triangle1);

    triangle_node2(1,t4) = triangle_node1(5,triangle1);
    triangle_node2(2,t4) = triangle_node1(6,triangle1);
    triangle_node2(3,t4) = triangle_node1(4,triangle1);

  end
%
%  Step 2.
%  Examine sorted edge information.  The first time an edge is encountered,
%  generate two new nodes, then assign them (usually) to the four subtriangles
%  of the two triangles that share that edge.
%
  node = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1

    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);

    l1 = edge_data(3,edge);
    l3 = edge_data(4,edge);

    if ( l1 == 1 & l3 == 2 )
      l2 = 4;
    elseif ( l1 == 1 & l3 == 3 )
      l2 = 6;
    elseif ( l1 == 2 & l3 == 3 )
      l2 = 5;
    end

    triangle1 = edge_data(5,edge);
%
%  If this is the first time we've encountered this edge,
%  create the new new nodes.
%
    if ( n1 ~= n1_old | n2 ~= n2_old )

      n1_old = n1;
      n2_old = n2;

      v1 = triangle_node1(l1,triangle1);
      v2 = triangle_node1(l2,triangle1);
      v3 = triangle_node1(l3,triangle1);

      node = node + 1;
      v4 = node;
      node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v1) + node_xy1(1:2,v2) );

      node = node + 1;
      v5 = node;
      node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v2) + node_xy1(1:2,v3) );

    end

    t1 = ( triangle1 - 1 ) * 4 + 1;
    t2 = ( triangle1 - 1 ) * 4 + 2;
    t3 = ( triangle1 - 1 ) * 4 + 3;

    if ( l1 == 1 & l3 == 2 )

      if ( triangle_node1(1,triangle1) == v1 )
        triangle_node2(4,t1) = v4;
        triangle_node2(4,t2) = v5;
      else
        triangle_node2(4,t1) = v5;
        triangle_node2(4,t2) = v4;
      end

    elseif ( l1 == 1 & l3 == 3 )

      if ( triangle_node1(l1,triangle1) == v1 )
        triangle_node2(6,t1) = v4;
        triangle_node2(6,t3) = v5;
      else
        triangle_node2(6,t1) = v5;
        triangle_node2(6,t3) = v4;
      end

    elseif ( l1 == 2 & l3 == 3 )

      if ( triangle_node1(l1,triangle1) == v1 )
        triangle_node2(5,t3) = v4;
        triangle_node2(5,t2) = v5;
      else
        triangle_node2(5,t3) = v5;
        triangle_node2(5,t2) = v4;
      end

    end

  end
%
%  Step 3.
%  Each old triangle has a single central subtriangle, for which we now
%  need to generate three new "interior" nodes.
%
  for triangle1 = 1 : triangle_num1

    v4 = triangle_node1(4,triangle1);
    v5 = triangle_node1(5,triangle1);
    v6 = triangle_node1(6,triangle1);

    t1 = ( triangle1 - 1 ) * 4 + 1;
    t2 = ( triangle1 - 1 ) * 4 + 2;
    t3 = ( triangle1 - 1 ) * 4 + 3;
    t4 = ( triangle1 - 1 ) * 4 + 4;

    node = node + 1;
    node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v5) + node_xy1(1:2,v6) );
    triangle_node2(4,t4) = node;
    triangle_node2(4,t3) = node;

    node = node + 1;
    node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v6) + node_xy1(1:2,v4) );
    triangle_node2(5,t4) = node;
    triangle_node2(5,t1) = node;

    node = node + 1;
    node_xy2(1:2,node) = 0.5 * ( node_xy1(1:2,v4) + node_xy1(1:2,v5) );
    triangle_node2(6,t4) = node;
    triangle_node2(6,t2) = node;

  end

  return
end
