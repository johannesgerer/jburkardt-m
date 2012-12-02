function [ adj_num, adj_col ] = adj_size_q4_mesh ( node_num, element_num, ...
  element_node, element_neighbor )

%*****************************************************************************80
%
%% ADJ_SIZE_Q4_MESH counts adjacencies in a Q4 mesh.
%
%  Discussion:
%
%    This routine is called to count the adjacencies, so that the
%    appropriate amount of memory can be set aside for storage when
%    the adjacency structure is created.
%
%    The mesh is assumed to involve 4-node quadrilaterals.
%
%    Two nodes are "adjacent" if they are both nodes in some quadrilateral.
%    Also, a node is considered to be adjacent to itself.
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
%    29 September 2009
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
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), lists the
%    nodes that make up each element, in counterclockwise order.
%
%    Input, integer ELEMENT_NEIGHBOR(4,ELEMENT_NUM), for each
%    side of a element, lists the neighboring elment, or -1 if there is
%    no neighbor.
%
%    Output, ADJ_NUM, the number of adjacencies.
%
%    Output, integer ADJ_COL(NODE_NUM+1), Information about
%    column J is stored in entries ADJ_COL(J) through ADJ_COL(J+1)-1 of ADJ.
%
  element_order = 4;

  adj_num = 0;
%
%  Set every node to be adjacent to itself.
%
  adj_col(1:node_num) = 1;
%
%  Examine each element.
%
  for element = 1 : element_num

    n1 = element_node(1,element);
    n2 = element_node(2,element);
    n3 = element_node(3,element);
    n4 = element_node(4,element);
%
%  Add edge (1,3).
%
    adj_col(n1) = adj_col(n1) + 1;
    adj_col(n3) = adj_col(n3) + 1;
%
%  Add edge (2,4).
%
    adj_col(n2) = adj_col(n2) + 1;
    adj_col(n4) = adj_col(n4) + 1;
%
%  Add edge (1,2) if this is the first occurrence,
%  that is, if the edge (1,2) is on a boundary (ELEMENT2 <= 0)
%  or if this element is the first of the pair in which the edge
%  occurs (ELEMENT < ELEMENT2).
%
    element2 = element_neighbor(1,element);

    if ( element2 < 0 | element < element2 )
      adj_col(n1) = adj_col(n1) + 1;
      adj_col(n2) = adj_col(n2) + 1;
    end
%
%  Add edge (2,3).
%
    element2 = element_neighbor(2,element);

    if ( element2 < 0 | element < element2 )
      adj_col(n2) = adj_col(n2) + 1;
      adj_col(n3) = adj_col(n3) + 1;
    end
%
%  Add edge (3,4).
%
    element2 = element_neighbor(3,element);

    if ( element2 < 0 | element < element2 )
      adj_col(n3) = adj_col(n3) + 1;
      adj_col(n4) = adj_col(n4) + 1;
    end
%
%  Add edge (4,1).
%
    element2 = element_neighbor(4,element);

    if ( element2 < 0 | element < element2 )
      adj_col(n4) = adj_col(n4) + 1;
      adj_col(n1) = adj_col(n1) + 1;
    end

  end
%
%  We used ADJ_COL to count the number of entries in each column.
%  Convert it to pointers into the ADJ array.
%
  for node = node_num + 1 : -1 : 2
    adj_col(node) = adj_col(node-1);
  end

  adj_col(1) = 1;
  for node = 2 : node_num + 1
    adj_col(node) = adj_col(node) + adj_col(node-1);
  end
%
%  Finally, record the total number of adjacencies.
%
  adj_num = adj_col(node_num+1) - 1;

  return
end
