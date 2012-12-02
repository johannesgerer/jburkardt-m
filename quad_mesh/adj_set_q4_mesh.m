function adj = adj_set_q4_mesh ( node_num, element_num, element_node, ...
  element_neighbor, adj_num, adj_col )

%*****************************************************************************80
%
%% ADJ_SET_Q4_MESH sets adjacencies in a Q4 mesh.
%
%  Discussion:
%
%    This routine is called to set the adjacency values, after the
%    appropriate amount of memory has been set aside for storage.
%
%    The mesh is assumed to involve 4-node quadrilaterals.
%
%    Two nodes are "adjacent" if they are both nodes in some quadrilateral.
%    Also, a node is considered to be adjacent to itself.
%
%    This routine can be used to create the compressed column storage
%    for a bilinear quadrilateral finite element discretization of 
%    Poisson's equation in two dimensions.
%
%  Diagram:
%
%         side 3
%       4-------3
%    s  |       |  s
%    i  |       |  i
%    d  |       |  d
%    e  |       |  e
%       |       |
%    4  |       |  2
%       |       |
%       1-------2
%
%         side 1
%
%    The local node numbering
%
%
%   20-21-22-23-24
%    |  |  |  |  |
%    |  |  |  |  |
%   15-16-17-18-19
%    |  |  |  |  |
%    |  |  |  |  |
%   10-11-12-13-14
%    |  |  |  |  |
%    |  |  |  |  |
%    5--6--7--8--9
%    |  |  |  |  |
%    |  |  |  |  |
%    0--1--2--3--4
%
%    A sample grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2009
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
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), lists the nodes that
%    make up each element in counterclockwise order.
%
%    Input, integer ELEMENT_NEIGHBOR(4,ELEMENT_NUM), for each side of
%    an element, lists the neighboring element, or -1 if there is
%    no neighbor.
%
%    Input, integer ADJ_NUM, the number of adjacencies.
%
%    Input, integer ADJ_COL(NODE_NUM+1).  Information about column J is stored
%    in entries ADJ_COL(J) through ADJ_COL(J+1)-1 of ADJ.
%
%    Output, integer ADJ(ADJ_NUM), the adjacency information.
%
  adj(1:adj_num) = -1;
  adj_copy(1:node_num) = adj_col(1:node_num);
%
%  Set every node to be adjacent to itself.
%
  for node = 1 : node_num
    adj(adj_copy(node)) = node;
    adj_copy(node) = adj_copy(node) + 1;
  end
%
%  Examine each element.
%
  for element = 1 : element_num

    n1 = element_node(1,element);
    n2 = element_node(2,element);
    n3 = element_node(3,element);
    n4 = element_node(4,element);
%
%  Add edges (1,3) and (2,4).  There is no need to check for redundancy,
%  since this is the only case when these nodes can share an element.
%
    adj(adj_copy(n1)) = n3;
    adj_copy(n1) = adj_copy(n1) + 1;
    adj(adj_copy(n3)) = n1;
    adj_copy(n3) = adj_copy(n3) + 1;

    adj(adj_copy(n2)) = n4;
    adj_copy(n2) = adj_copy(n2) + 1;
    adj(adj_copy(n4)) = n2;
    adj_copy(n4) = adj_copy(n4) + 1;
%
%  Add edge (1,2) if this is the first occurrence,
%  that is, if the edge (1,2) is on a boundary (ELEMENT2 <= 0)
%  or if this element is the first of the pair in which the edge
%  occurs (ELEMENT < ELEMENT2).
%
    element2 = element_neighbor(1,element);

    if ( element2 < 0 | element < element2 )
      adj(adj_copy(n1)) = n2;
      adj_copy(n1) = adj_copy(n1) + 1;
      adj(adj_copy(n2)) = n1;
      adj_copy(n2) = adj_copy(n2) + 1;
    end
%
%  Add edge (2,3).
%
    element2 = element_neighbor(2,element);

    if ( element2 < 0 | element < element2 )
      adj(adj_copy(n2)) = n3;
      adj_copy(n2) = adj_copy(n2) + 1;
      adj(adj_copy(n3)) = n2;
      adj_copy(n3) = adj_copy(n3) + 1;
    end
%
%  Add edge (3,4).
%
    element2 = element_neighbor(3,element);

    if ( element2 < 0 | element < element2 )
      adj(adj_copy(n3)) = n4;
      adj_copy(n3) = adj_copy(n3) + 1;
      adj(adj_copy(n4)) = n3;
      adj_copy(n4) = adj_copy(n4) + 1;
    end
%
%  Add edge (4,1).
%
    element2 = element_neighbor(4,element);

    if ( element2 < 0 | element < element2 )
      adj(adj_copy(n4)) = n1;
      adj_copy(n4) = adj_copy(n4) + 1;
      adj(adj_copy(n1)) = n4;
      adj_copy(n1) = adj_copy(n1) + 1;
    end
      
  end
%
%  Ascending sort the entries for each node.
%
  for node = 1 : node_num
    k1 = adj_col(node);
    k2 = adj_col(node+1)-1;
    adj(k1:k2) = i4vec_sort_heap_a ( k2+1-k1, adj(k1:k2) );
  end

  return
end
