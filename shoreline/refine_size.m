function [ node_num2, triangle_num2, edge_data ] = refine_size ( node_num1, ...
  triangle_num1, triangle_node1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_REFINE_SIZE sizes a refined order 3 triangulation.
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
%    This routine simply determines the sizes of the resulting node
%    and triangle arrays.
%
%    The primary amount of work occurs in sorting a list of 3 * TRIANGLE_NUM
%    data items, one item for every edge of every triangle.  Each
%    data item records, for a given edge, the global indices
%    of the two endpoints, the local indices of the two endpoints,
%    and the index of the triangle.
%
%    Through careful sorting, it is possible to arrange this data in
%    a way that allows the proper generation of the interpolated nodes.
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
%    Input, integer NODE_NUM1, the number of nodes in the original mesh.
%
%    Input, integer TRIANGLE_NUM1, the number of triangles in the
%    original mesh.
%
%    Input, integer TRIANGLE_NODE1(TRIANGLE_NUM1,3), the indices of the nodes
%    that form the triangles in the input mesh.
%
%    Output, integer NODE_NUM2, the number of nodes in the refined mesh.
%
%    Output, integer TRIANGLE_NUM2, the number of triangles in the
%    refined mesh.
%
%    Output, integer EDGE_DATA(3*TRIANGLE_NUM1,5), edge data that will
%    be needed by TRIANGULATION_ORDER3_REFINE_COMPUTE.
%
  edge_data = zeros(3*triangle_num1,5);
%
%  Step 1.
%  From the list of nodes for triangle T, of the form: (I,J,K)
%  construct the edge relations:
%
%    (I,J,1,2,T)
%    (I,K,1,3,T)
%    (J,K,2,3,T)
%
%  In order to make matching easier, we reorder each pair of nodes
%  into ascending order.
%
  row = 0;

  for triangle = 1 : triangle_num1

    i = triangle_node1(triangle,1);
    j = triangle_node1(triangle,2);
    k = triangle_node1(triangle,3);

    a = min ( i, j );
    b = max ( i, j );
    row = row + 1;
    edge_data(row,1:5) = [ a, b, 1, 2, triangle ];

    a = min ( j, k );
    b = max ( j, k );
    row = row + 1;
    edge_data(row,1:5) = [ a, b, 2, 3, triangle ];

    a = min ( k, i );
    b = max ( k, i );
    row = row + 1;
    edge_data(row,1:5) = [ a, b, 1, 3, triangle ];

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on items in columns 1 and 2; the routine we call here
%  sorts on the full column but that won't hurt us.
%
%  What we need is to find all cases where triangles share an edge.
%  By sorting the columns of the EDGE_DATA array, we will put shared edges
%  next to each other.
%
  edge_data = sortrows ( edge_data );
% edge_data = i4col_sort_a ( 5, 3*triangle_num1, edge_data );
%
%  Step 3. All the triangles which share an edge show up as consecutive
%  columns with identical first two entries.  Figure out how many new
%  nodes there are, and allocate space for their coordinates.
%
  node_num2 = node_num1;

  n1_old = -1;
  n2_old = -1;

  for edge = 1 : 3 * triangle_num1
    n1 = edge_data(edge,1);
    n2 = edge_data(edge,2);
    if ( n1 ~= n1_old || n2 ~= n2_old )
      node_num2 = node_num2 + 1;
      n1_old = n1;
      n2_old = n2;
    end
  end

  triangle_num2 = 4 * triangle_num1;

  return
end
