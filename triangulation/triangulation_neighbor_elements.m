function element_neighbor = triangulation_neighbor_elements ( ...
  element_order, element_num, element_node )

%*****************************************************************************80
%
%% TRIANGULATION_NEIGHBOR_ELEMENTS determines element neighbors.
%
%  Discussion:
%
%    A triangulation of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each element.  However, in some cases, it is necessary to know
%    element adjacency information, that is, which element, if any,
%    is adjacent to a given element on a particular side.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 3 * ELEMENT_NUM
%    data items.
%
%    This routine was modified to use columns instead of rows.
%
%  Example:
%
%    The input information from ELEMENT_NODE:
%
%    Element    Nodes
%    --------   ---------------
%     1         3      4      1
%     2         3      1      2
%     3         3      2      8
%     4         2      1      5
%     5         8      2     13
%     6         8     13      9
%     7         3      8      9
%     8        13      2      5
%     9         9     13      7
%    10         7     13      5
%    11         6      7      5
%    12         9      7      6
%    13        10      9      6
%    14         6      5     12
%    15        11      6     12
%    16        10      6     11
%
%    The output information in ELEMENT_NEIGHBOR:
%
%    Element   Neighboring Elements
%    --------  ---------------------
%
%     1        -1     -1      2
%     2         1      4      3
%     3         2      5      7
%     4         2     -1      8
%     5         3      8      6
%     6         5      9      7
%     7         3      6     -1
%     8         5      4     10
%     9         6     10     12
%    10         9      8     11
%    11        12     10     14
%    12         9     11     13
%    13        -1     12     16
%    14        11     -1     15
%    15        16     14     -1
%    16        13     15     -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_ORDER, the order of the element.
%
%    Input, integer ELEMENT_NUM, the number of element.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the nodes that 
%    make up each element.
%
%    Output, integer ELEMENT_NEIGHBOR(3,ELEMENT_NUM), the three elements that are direct
%    neighbors of a given element.  ELEMENT_NEIGHBOR(1,I) is the index of the element
%    which touches side 1, defined by nodes 2 and 3, and so on.  ELEMENT_NEIGHBOR(1,I)
%    is negative if there is no neighbor on that side.  In this case, that
%    side of the element lies on the boundary of the triangulation.
%

%
%  Step 1.
%  From the list of nodes for element E, of the form: (I,J,K)
%  construct the three neighbor relations:
%
%    (I,J,3,E) or (J,I,3,E),
%    (J,K,1,E) or (K,J,1,E),
%    (K,I,2,E) or (I,K,2,E)
%
%  where we choose (I,J,3,E) if I < J, or else (J,I,3,E)
%
  col = zeros ( 4, 3 * element_num );

  for element = 1 : element_num

    i = element_node(1,element);
    j = element_node(2,element);
    k = element_node(3,element);

    if ( i < j )
      col(1:4,1+3*(element-1)) = [ i, j, 3, element ]';
    else
      col(1:4,1+3*(element-1)) = [ j, i, 3, element ]';
    end

    if ( j < k )
      col(1:4,2+3*(element-1)) = [ j, k, 1, element ]';
    else
      col(1:4,2+3*(element-1)) = [ k, j, 1, element ]';
    end

    if ( k < i )
      col(1:4,3+3*(element-1)) = [ k, i, 2, element ]';
    else
      col(1:4,3+3*(element-1)) = [ i, k, 2, element ]';
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1 and 2; the routine we call here
%  sorts on rows 1 through 4 but that won't hurt us.
%
%  What we need is to find cases where two elements share an edge.
%  Say they share an edge defined by the nodes I and J.  Then there are
%  two columns of COL that start out ( I, J, ?, ? ).  By sorting COL,
%  we make sure that these two columns occur consecutively.  That will
%  make it easy to notice that the elements are neighbors.
%
  col = i4col_sort_a ( 4, 3*element_num, col );
%
%  Step 3. Neighboring elements show up as consecutive columns with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in ELEMENT_NEIGHBOR.
%
  element_neighbor(1:3,1:element_num) = -1;

  icol = 1;

  while ( 1 )

    if ( 3 * element_num <= icol )
      break
    end

    if ( col(1,icol) ~= col(1,icol+1) || col(2,icol) ~= col(2,icol+1) )
      icol = icol + 1;
      continue
    end

    side1 = col(3,icol);
    element1 =  col(4,icol);
    side2 = col(3,icol+1);
    element2 =  col(4,icol+1);

    element_neighbor(side1,element1) = element2;
    element_neighbor(side2,element2) = element1;

    icol = icol + 2;

  end

  return
end
