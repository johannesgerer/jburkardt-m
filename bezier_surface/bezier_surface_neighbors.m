function rectangle_neighbor = bezier_surface_neighbors ( rectangle_num, ...
  rectangle_node )

%*****************************************************************************80
%
%% BEZIER_SURFACE_NEIGHBORS determines Bezier rectangle neighbors.
%
%  Discussion:
%
%    A (bicubic) Bezier surface is constructed of patches.  Each
%    patch is an (X,Y,Z) image of the unit rectangle in (U,V) space.
%    Two patches may be said to be "neighbors" if their images share
%    a side.
%
%    It is perfectly possible for each Bezier patch to have NO neighbors.
%    It is perfectly possible for each Bezier patch to have many neighbors
%    sharing a single side.
%
%    However, in the most common case, and the one handled here, we
%    may assume that the (X,Y,Z) patches fit together in a way similar
%    to the way quilt patches form a surface, so that most rectangles
%    have four neighbors, one on each side, while boundary rectangles
%    might have fewer neighbors.
%
%    This routine creates a data structure recording the neighbor information.
%
%    The primary amount of work occurs in sorting a list of
%    4 * RECTANGLE_NUM data items representing the sides of each patch.
%
%    The nodes of a single rectangle are assumed to be numbered as follows:
%
%    V
%    |   13-14-15-16
%    |    |  |  |  |
%    |    9-10-11-12
%    |    |  |  |  |
%    |    5--6--7--8
%    |    |  |  |  |
%    |    1--2--3--4
%    |
%    +--------------->U
%
%    We assume that a neighbor patch will agree in its (X,Y,Z) values
%    for all four nodes along a single side (although the nodes might
%    be listed in reverse order.)
%
%    We assume that there is at most one neighbor patch on each side.
%    (However, even in a simple case like the Utah teapot, this is not
%    true, because at the top and bottom, many patches have one side
%    that degenerates to a single point, and several such patches
%    meet at that point!)
%
%    We choose to number the sides of each patch as follows:
%
%
%    V      SIDE 3
%    |
%    |   13-14-15-16
%    | S  |  |  |  |
%    | I  9-10-11-12
%    | D  |  |  |  | SIDE 2
%    | E  5--6--7--8
%    |    |  |  |  |
%    | 4  1--2--3--4
%    |       SIDE 1
%    +--------------->U
%
%    And these indices for the sides correspond to the first index
%    in the RECTANGLE_NEIGHBOR array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RECTANGLE_NUM, the number of rectangles.
%
%    Input, integer RECTANGLE_NODE(16,RECTANGLE_NUM), the nodes that make up
%    each rectangle.
%
%    Output, integer RECTANGLE_NEIGHBOR(4,RECTANGLE_NUM), the indices of
%    the rectanges that are direct neighbors of a given rectangle.
%    RECTANGLE_NEIGHBOR(1,I) is the index of the rectangle which touches
%    side 1, defined by nodes 1 and 4, and so on.  RECTANGLE_NEIGHBOR(1,I)
%    is negative if there is no neighbor on that side.
%

%
%  Step 1.
%  From the list of vertices for rectangle T,
%  construct records that describe the four side segments, by listing
%  the first and last nodes of each segment.
%  To make matching easier later, we sort each pair of nodes.
%
  for rectangle = 1 : rectangle_num

    i1 = rectangle_node(1,rectangle);
    i2 = rectangle_node(4,rectangle);
    i3 = rectangle_node(13,rectangle);
    i4 = rectangle_node(16,rectangle);

    if ( i1 < i2 )
      row(4*(rectangle-1)+1,1:4) = [ i1, i2, 1, rectangle ];
    else
      row(4*(rectangle-1)+1,1:4) = [ i2, i1, 1, rectangle ];
    end

    if ( i2 < i4 )
      row(4*(rectangle-1)+2,1:4) = [ i2, i4, 2, rectangle ];
    else
      row(4*(rectangle-1)+2,1:4) = [ i4, i2, 2, rectangle ];
    end

    if ( i4 < i3 )
      row(4*(rectangle-1)+3,1:4) = [ i4, i3, 3, rectangle ];
    else
      row(4*(rectangle-1)+3,1:4) = [ i3, i4, 3, rectangle ];
    end

    if ( i3 < i1 )
      row(4*(rectangle-1)+4,1:4) = [ i3, i1, 4, rectangle ];
    else
      row(4*(rectangle-1)+4,1:4) = [ i1, i3, 4, rectangle ];
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%  We only intend to sort on columns 1 and 2; the routine we call here
%  sorts on columns 1 through 3 but that won't hurt us.
%
%  What we need is to find cases where two rectangles share an edge.
%  Say they share an edge defined by the nodes I and J.  Then there are
%  two rows of ROW that start out ( I, J, ?, ? ).  By sorting ROW,
%  we make sure that these two rows occur consecutively.  That will
%  make it easy to notice that the rectangles are neighbors.
%
  row = i4row_sort_a ( 4*rectangle_num, 4, row );
%
%  Step 3. Neighboring rectangles show up as consecutive rows with
%  identical first two entries.  Whenever you spot this happening,
%  make the appropriate entries in RECTANGLE_NEIGHBOR.
%
  rectangle_neighbor(1:4,1:rectangle_num) = -1;

  irow = 1;

  while ( 1 )

    if ( 4 * rectangle_num <= irow )
      break
    end

    if ( row(irow,1) ~= row(irow+1,1) | row(irow,2) ~= row(irow+1,2) )
      irow = irow + 1;
      continue
    end

    side1 = row(irow,3);
    rectangle1 = row(irow,4);
    side2 = row(irow+1,3);
    rectangle2 = row(irow+1,4);

    rectangle_neighbor(side1,rectangle1) = rectangle2;
    rectangle_neighbor(side2,rectangle2) = rectangle1;

    irow = irow + 2;

  end

  return
end

