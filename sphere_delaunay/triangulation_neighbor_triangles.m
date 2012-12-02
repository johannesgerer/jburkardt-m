function triangle_neighbor = triangulation_neighbor_triangles ( ...
  triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_NEIGHBOR_TRIANGLES determines triangle neighbors.
%
%  Discussion:
%
%    A triangulation of a set of nodes can be completely described by
%    the coordinates of the nodes, and the list of nodes that make up
%    each triangle.  However, in some cases, it is necessary to know
%    triangle adjacency information, that is, which triangle, if any,
%    is adjacent to a given triangle on a particular side.
%
%    This routine creates a data structure recording this information.
%
%    The primary amount of work occurs in sorting a list of 3 * TRIANGLE_NUM
%    data items.
%
%    This routine was modified to use columns instead of rows.
%
%  Example:
%
%    The input information from TRIANGLE_NODE:
%
%    Triangle   Nodes
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
%    The output information in TRIANGLE_NEIGHBOR:
%
%    Triangle  Neighboring Triangles
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
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the nodes that 
%    make up each triangle.
%
%    Output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the three triangles that are direct
%    neighbors of a given triangle.  TRIANGLE_NEIGHBOR(1,I) is the index of the triangle
%    which touches side 1, defined by nodes 2 and 3, and so on.  TRIANGLE_NEIGHBOR(1,I)
%    is negative if there is no neighbor on that side.  In this case, that
%    side of the triangle lies on the boundary of the triangulation.
%

%
%  Step 1.
%  From the list of nodes for triangle T, of the form: (I,J,K)
%  construct the three neighbor relations:
%
%    (I,J,3,T) or (J,I,3,T),
%    (J,K,1,T) or (K,J,1,T),
%    (K,I,2,T) or (I,K,2,T)
%
%  where we choose (I,J,3,T) if I < J, or else (J,I,3,T)
%
  col = zeros ( 4, 3 * triangle_num );

  for tri = 1 : triangle_num

    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);

    if ( i < j )
      col(1:4,1+3*(tri-1)) = [ i, j, 3, tri ]';
    else
      col(1:4,1+3*(tri-1)) = [ j, i, 3, tri ]';
    end

    if ( j < k )
      col(1:4,2+3*(tri-1)) = [ j, k, 1, tri ]';
    else
      col(1:4,2+3*(tri-1)) = [ k, j, 1, tri ]';
    end

    if ( k < i )
      col(1:4,3+3*(tri-1)) = [ k, i, 2, tri ]';
    else
      col(1:4,3+3*(tri-1)) = [ i, k, 2, tri ]';
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on rows 1 and 2; the routine we call here
%  sorts on rows 1 through 4 but that won't hurt us.
%
%  What we need is to find cases where two triangles share an edge.
%  Say they share an edge defined by the nodes I and J.  Then there are
%  two columns of COL that start out ( I, J, ?, ? ).  By sorting COL,
%  we make sure that these two columns occur consecutively.  That will
%  make it easy to notice that the triangles are neighbors.
%
  col = i4col_sort_a ( 4, 3*triangle_num, col );
%
%  Step 3. Neighboring triangles show up as consecutive columns with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in TRIANGLE_NEIGHBOR.
%
  triangle_neighbor(1:3,1:triangle_num) = -1;

  icol = 1;

  while ( 1 )

    if ( 3 * triangle_num <= icol )
      break
    end

    if ( col(1,icol) ~= col(1,icol+1) || col(2,icol) ~= col(2,icol+1) )
      icol = icol + 1;
      continue
    end

    side1 = col(3,icol);
    tri1 =  col(4,icol);
    side2 = col(3,icol+1);
    tri2 =  col(4,icol+1);

    triangle_neighbor(side1,tri1) = tri2;
    triangle_neighbor(side2,tri2) = tri1;

    icol = icol + 2;

  end

  return
end
