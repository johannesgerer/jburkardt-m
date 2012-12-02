function element_neighbor = neighbor_elements_q4_mesh ( element_num, ...
  element_node )

%*****************************************************************************80
%
%% NEIGHBOR_ELEMENTS_Q4_MESH determines element neighbors in a Q4 mesh.
%
%  Discussion:
%
%    A quadrilateral mesh of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each element.  However, in some cases, it is necessary to know
%    element adjacency information, that is, which element, if any,
%    is adjacent to a given element on a particular side.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 4 * ELEMENT_NUM
%    data items.
%
%    Note that COL is a work array allocated dynamically inside this
%    routine.  It is possible, for very large values of ELEMENT_NUM,
%    that the necessary amount of memory will not be accessible, and the
%    routine will fail.  This is a limitation of the implementation of
%    dynamic arrays in FORTRAN90.  One way to get around this would be
%    to require the user to declare ROW in the calling routine
%    as an allocatable array, get the necessary memory explicitly with
%    an ALLOCATE statement, and then pass ROW into this routine.
%
%    Of course, the point of dynamic arrays was to make it easy to
%    hide these sorts of temporary work arrays from the poor user%
%
%    This routine was revised to store the edge data in a column
%    array rather than a row array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_NODE(4,ELEMENT_NUM), the nodes
%    that make up each element.
%
%    Output, integer ELEMENT_NEIGHBOR(4,ELEMENT_NUM), lists the
%    neighboring element on each side of a given element, or -1 if there is
%    no neighbor.
%
  element_order = 4;

  col = zeros(4,4*element_num);
%
%  Step 1.
%  From the list of nodes for element Q, of the form: (I,J,K,L)
%  construct the four neighbor relations:
%
%    (I,J,1,Q) or (J,I,1,Q),
%    (J,K,2,Q) or (K,J,2,Q),
%    (K,L,3,Q) or (L,K,3,Q)
%    (K,I,4,Q) or (I,K,4,Q)
%
%  where we choose (I,J,1,Q) if I < J, or else (J,I,1,Q)
%
  for q = 1 : element_num

    i = element_node(1,q);
    j = element_node(2,q);
    k = element_node(3,q);
    l = element_node(4,q);

    if ( i < j )
      col(1:4,4*(q-1)+1) = [ i, j, 1, q ]';
    else
      col(1:4,4*(q-1)+1) = [ j, i, 1, q ]';
    end

    if ( j < k )
      col(1:4,4*(q-1)+2) = [ j, k, 2, q ]';
    else
      col(1:4,4*(q-1)+2) = [ k, j, 2, q ]';
    end

    if ( k < l ) 
      col(1:4,4*(q-1)+3) = [ k, l, 3, q ]';
    else
      col(1:4,4*(q-1)+3) = [ l, k, 3, q ]';
    end

    if ( l < i )
      col(1:4,4*(q-1)+4) = [ l, i, 4, q ]';
    else
      col(1:4,4*(q-1)+4) = [ i, l, 4, q ]';
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
  col = i4col_sort_a ( 4, 4*element_num, col );
%
%  Step 3. Neighboring elements show up as consecutive columns with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in ELEMENT_NEIGHBOR.
%
  element_neighbor(1:4,1:element_num) = -1;

  icol = 1;

  while ( 1 )

    if ( 4 * element_num <= icol )
      break
    end

    if ( col(1,icol) ~= col(1,icol+1) | col(2,icol) ~= col(2,icol+1) )
      icol = icol + 1;
      continue
    end

    side1 = col(3,icol);
    q1    = col(4,icol);
    side2 = col(3,icol+1);
    q2    = col(4,icol+1);

    element_neighbor(side1,q1) = q2;
    element_neighbor(side2,q2) = q1;

    icol = icol + 2;

  end

  return
end
