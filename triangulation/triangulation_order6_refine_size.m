function [ node_num2, triangle_num2, edge_data ] = ...
  triangulation_order6_refine_size ( node_num1, triangle_num1, triangle_node1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_REFINE_SIZE sizes a refined order 6 triangulation.
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
%    This routine determines the sizes of the resulting node and
%    triangles, and constructs an edge array that can be used to
%    properly number the new nodes.
%
%    The primary work occurs in sorting a list related to the edges.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2011
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
%    Input, integer TRIANGLE_NODE1(6,TRIANGLE_NUM1), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Input, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Input, integer TRIANGLE_NUM2, the number of triangles in the refined mesh.
%
%    Output, integer EDGE_DATA(5,3*TRIANGLE_NUM1), edge data needed by
%    TRIANGULATION_ORDER6_REFINE_COMPUTE.
%

%
%  Step 1:
%  From the list of vertices for triangle T, of the form: (I,J,K),
%  construct the edge relations:
%
%    (I,J,1,2,T)
%    (I,K,1,3,T)
%    (J,K,2,3,T)
%
%  To make matching easier, we reorder each pair of nodes into
%  ascending order.
%
  for triangle1 = 1 : triangle_num1

    i = triangle_node1(1,triangle1);
    j = triangle_node1(2,triangle1);
    k = triangle_node1(3,triangle1);

    a = min ( i, j );
    b = max ( i, j );

    edge_data(1:5,3*(triangle1-1)+1) = [ a, b, 1, 2, triangle1 ]';

    a = min ( i, k );
    b = max ( i, k );

    edge_data(1:5,3*(triangle1-1)+2) = [ a, b, 1, 3, triangle1 ]';

    a = min ( j, k );
    b = max ( j, k );

    edge_data(1:5,3*(triangle1-1)+3) = [ a, b, 2, 3, triangle1 ]';

  end
%
%  Step 2: Perform an ascending dictionary sort on the relations.
%
  edge_data = i4col_sort_a ( 5, 3*triangle_num1, edge_data );
%
%  Step 3: Each shared edge will show up twice, consecutively,
%  in the EDGE_DATA array.  Each unique edge will generate
%  two new nodes, and each triangle will generate three new nodes.
%
  node_num2 = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1
    n1 = edge_data(1,edge);
    n2 = edge_data(2,edge);
    if ( n1 ~= n1_old | n2 ~= n2_old )
      node_num2 = node_num2 + 2;
      n1_old = n1;
      n2_old = n2;
    end
  end

  node_num2 = node_num2 + 3 * triangle_num1;

  triangle_num2 = 4 * triangle_num1;

  return
end
