function element_node = sphere_grid_q4_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_Q4_ELEMENT produces a Q4 sphere grid.
%
%  Discussion:
%
%    This would be the same as the grid in a plane, except that all the
%    nodes along the bottom edge are identified (replaced by a single node
%    that is the south pole) and similarly for the top edge, and the
%    nodes on the extreme right edge are identified pairwise with those 
%    on the extreme left edge.
%
%  Example:
%
%    Input:
%
%      NELEMX = 3, NELEMY = 4
%
%    Output:
%
%      ELEMENT_NODE =
%         1,  1,  3,  2;
%         1,  1,  4,  3;
%         1,  1,  2,  4;
%         2,  3,  6,  5;
%         3,  4,  7,  6;
%         4,  2,  5,  7;
%         5,  6,  9,  8;
%         6,  7, 10,  9;
%         7,  5,  8, 10;
%         8,  9, 11, 11;
%         9, 10, 11, 11;
%        10,  8, 11, 11;
%
%  Grid:
%
%   11----11----11----11
%    |     |     |     |
%    | E10 | E11 | E12 |
%    |     |     |     |
%    8-----9----10-----8
%    |     |     |     |
%    | E7  | E8  | E9  |
%    |     |     |     |
%    5-----6-----7-----5
%    |     |     |     |
%    | E4  | E5  | E6  |
%    |     |     |     |
%    2-----3-----4-----2
%    |     |     |     |
%    | E1  | E2  | E3  |
%    |     |     |     |
%    1-----1-----1-----1
%
%  Reference Element Q4:
%
%    |
%    1  4------3
%    |  |      |
%    S  |      |
%    |  |      |
%    |  |      |
%    0  1------2
%    |
%    +--0--R---1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions.  The number of elements generated will be
%    NELEMX * NELEMY.
%
%    Output, integer ELEMENT_NODE(4,NELEMX*NELEMY), the nodes that form
%    each element.
%
  element_order = 4;

  element = 0;

  for j = 1 : nelemy

    base1 = ( j - 1 ) * nelemx + 2 - nelemx;

    for i = 1 : nelemx

      base2 = base1 + i - 1;

      element = element + 1;

      element_node(1,element) = base2;
      if ( i < nelemx )
        element_node(2,element) = base2 + 1;
      else
        element_node(2,element) = base1;
      end
      element_node(3,element) = element_node(2,element) + nelemx;
      element_node(4,element) = element_node(1,element) + nelemx;

      if ( j == 1 )

        element_node( 1,element) = 1;
        element_node( 2,element) = 1;

      elseif ( j == nelemy )

        element_node(3,element) = base1 + nelemx;
        element_node(4,element) = base1 + nelemx;

      end

    end
  end

  return
end
