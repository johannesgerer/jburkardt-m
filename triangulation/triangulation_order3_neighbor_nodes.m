function [ nabes_first, nabes_num, names_dim, nabes ] = ...
  triangulation_order3_neighbor_nodes ( node_num, triangle_num, nabes_max, ...
  triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_NEIGHBOR_NODES determines the neighbors of triangulation nodes.
%
%  Example:
%
%    On input, the triangle data structure is:
%
%    Triangle  Nodes
%    --------  ----------
%     1        3,   4,   1
%     2        3,   1,   2
%     3        3,   2,   6
%     4        2,   1,   5
%     5        6,   2,   5
%
%  On output, the auxilliary neighbor arrays are:
%
%    Node  Num  First
%    ----  ---  -----
%     1     4     1
%     2     4     5
%     3     4     9
%     4     2    13
%     5     3    15
%     6     3    18
%
%  and the neighbor array is:
%
%    Position  Node
%    --------  ----
%
%     1        2
%     2        3
%     3        4
%     4        5
%    -----------
%     5        1
%     6        3
%     7        5
%     8        6
%    -----------
%     9        1
%    10        2
%    11        4
%    12        6
%    -----------
%    13        1
%    14        3
%    -----------
%    15        1
%    16        2
%    17        6
%    -----------
%    18        2
%    19        3
%    20        5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer NABES_MAX, the maximum dimension of NABES.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up each triangle.
%
%    Output, integer NABES_FIRST(NODE_NUM), the index in NABES of the first
%    neighbor in the list for each node.
%
%    Output, integer NABES_NUM(NODE_NUM), the number of neighbors of each node.
%
%    Output, integer NABES_DIM, the dimension of NABES.
%
%    Output, integer NABES(NABES_DIM), a list of the neighbors of all the nodes.
%    Neighbors of node 1 are listed first, and so on.
%

%
%  Step 1.  From the triangle list (I,J,K)
%  construct the neighbor relations: (I,J), (J,K), (K,I), (J,I), (K,J), (I,K).
%
  nabes_dim = 0;
  for tri = 1 : triangle_num
    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);
    nabes1(nabes_dim+1:nabes_dim+6) = [ i, i, j, j, k, k ];
    nabes(nabes_dim+1:nabes_dim+6) = [ j, k, i, k, i, j ];
    nabes_dim = nabes_dim + 6;
  end
%
%  Step 2. Dictionary sort the neighbor relations.
%
  [ nabes1, nabes ] = i4vec2_sort_a ( nabes_dim, nabes1, nabes );
%
%  Step 3. Remove duplicate entries.
%
  [ unique_num, nabes1, nabes ] = ...
    i4vec2_sorted_unique ( nabes_dim, nabes1, nabes );

  nabes_dim = unique_num;
%
%  Step 4. Construct the NABES_NUM and NABES_FIRST data.
%
  nabes_num(1:node_num) = 0;
  nabes_first(1:node_num) = 0;
  i_current = 0;
  for nabe = 1 : nabes_dim
    i = nabes1(nabe);
    if ( i == i_current )
      nabes_num(i) = nabes_num(i) + 1;
    else
      i_current = i;
      nabes_first(i) = nabe;
      nabes_num(i) = 1;
    end
  end

  return
end
