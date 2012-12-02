function element_node = sphere_grid_t3_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_T3_ELEMENT produces a T3 sphere grid.
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
%         1,  3,  2;
%         1,  4,  3;
%         1,  2,  4;
%         2,  3,  5
%         6,  5,  3
%         3,  4,  6
%         7,  6,  4;
%         4,  2,  7;
%         5,  7,  2;
%         5,  6,  8;
%         9,  8,  6;
%         6,  7,  9;
%        10,  9,  7;
%         7,  5, 10;
%         8, 10,  5;
%         8,  9, 11;
%         9, 10, 11;
%        10,  8, 11;
%
%  Grid:
%
%   11    11    11    11
%    | \   | \   | \   |
%    |  \  |  \  |  \  |
%    |E16\ |E17 \|E18\ |
%    8-----9----10-----8
%    | \E11| \E13| \E15|
%    |  \  |  \  |  \  |
%    |E10\ |E12\ |E14\ |
%    5-----6-----7-----5
%    | \E5 | \E7 | \E9 |
%    |  \  |  \  |  \  |
%    |E4 \ |E6 \ |E8 \ |
%    2-----3-----4-----2
%      \E1 | \E2 | \E3 |
%       \  |  \  |  \  |
%        \ |   \ |   \ |
%          1     1     1
%
%  Reference Element T3:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  |   \
%    |  |    \
%    0  1-----2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions.
%
%    Output, integer ELEMENT_NODE(3,NELEMX*NELEMY), the nodes that form
%    each element.
%
  element_order = 3;

  element = 0;

  for j = 1 : nelemy

    base1 = ( j - 1 ) * nelemx + 2 - nelemx;

    for i = 1 : nelemx

      base2 = base1 + i - 1;

      sw = base2;
      if ( i < nelemx )
        se = base2 + 1;
      else
        se = base1;
      end
      nw = sw + nelemx;
      ne = se + nelemx;

      if ( j == 1 )
        sw = 1;
        se = 1;
      elseif ( j == nelemx )
        nw = base1 + nelemx;
        ne = base1 + nelemx;
      end

      if ( 1 < j )
        element = element + 1;
        element_node(1,element) = sw;
        element_node(2,element) = se;
        element_node(3,element) = nw;
      end

      if ( j < nelemy )
        element = element + 1;
        element_node(1,element) = ne;
        element_node(2,element) = nw;
        element_node(3,element) = se;
      end

    end
  end

