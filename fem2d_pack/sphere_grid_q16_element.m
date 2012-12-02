function element_node = sphere_grid_q16_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_Q16_ELEMENT produces a Q16 sphere grid.
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
%      NELEMX = 2, NELEMY = 2
%
%    Output:
%
%      ELEMENT_NODE =
%         1,  1,  1,  1,  2,  3,  4,  5,  8,  9, 10, 11, 14, 15, 16, 17;
%         1,  1,  1,  1,  5,  6,  7,  2, 11, 12, 13,  8, 17, 18, 19, 14;
%        14, 15, 16, 17, 20, 21, 22, 23, 26, 27, 28, 29, 32, 32, 32, 32;
%        17, 18, 19, 14, 23, 24, 25, 20, 29, 30, 31, 26, 32, 32, 32, 32.
%
%  Grid:
%
%   32-32-32-32-32-32-32
%    |        |        |
%    |        |        |
%   26 27 28 29 30 31 26
%    |        |        |
%    |        |        |
%   20 21 22 23 24 25 20
%    |        |        |
%    | E3     | E4     |
%   14-15-16-17-18-19-14
%    |        |        |
%    |        |        |
%    8  9 10 11 12 13  8
%    |        |        |
%    |        |        |
%    2  3  4  5  6  7  2
%    |        |        |
%    | E1     | E2     |
%    1--1--1--1--1--1--1
%
%  Reference Element Q16:
%
%    |
%    1 13--14--15--16
%    |  |   :   :   |
%    |  |   :   :   |
%    |  9..10..11..12
%    S  |   :   :   |
%    |  |   :   :   |
%    |  5...6...7...8
%    |  |   :   :   |
%    |  |   :   :   |
%    0  1---2---3---4
%    |
%    +--0-----R-----1-->
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
%    X and Y directions.  The number of elements generated will be
%    NELEMX * NELEMY.
%
%    Output, integer ELEMENT_NODE(16,NELEMX*NELEMY), the nodes that form
%    each element.
%
  element_order = 16;

  element = 0;

  for j = 1 : nelemy

    base1 = ( j - 1 ) * 3 * ( 3 * nelemx ) + 2 - 3 * nelemx;

    for i = 1 : nelemx

      base2 = base1 + 3 * ( i - 1 );

      element = element + 1;

      element_node( 1,element) = base2;
      element_node( 2,element) = base2 + 1;
      element_node( 3,element) = base2 + 2;

      if ( i < nelemx )
        element_node( 4,element) = base2 + 3;
      else
        element_node( 4,element) = base1;
      end

      element_node( 5,element) = element_node( 1,element) + 3 * nelemx;
      element_node( 6,element) = element_node( 2,element) + 3 * nelemx;
      element_node( 7,element) = element_node( 3,element) + 3 * nelemx;
      element_node( 8,element) = element_node( 4,element) + 3 * nelemx;

      element_node( 9,element) = element_node( 5,element) + 3 * nelemx;
      element_node(10,element) = element_node( 6,element) + 3 * nelemx;
      element_node(11,element) = element_node( 7,element) + 3 * nelemx;
      element_node(12,element) = element_node( 8,element) + 3 * nelemx;

      element_node(13,element) = element_node( 9,element) + 3 * nelemx;
      element_node(14,element) = element_node(10,element) + 3 * nelemx;
      element_node(15,element) = element_node(11,element) + 3 * nelemx;
      element_node(16,element) = element_node(12,element) + 3 * nelemx;

      if ( j == 1 )

        element_node( 1,element) = 1;
        element_node( 2,element) = 1;
        element_node( 3,element) = 1;
        element_node( 4,element) = 1;

      elseif ( j == nelemy )

        element_node(13,element) = base1 + 9 * nelemx;
        element_node(14,element) = base1 + 9 * nelemx;
        element_node(15,element) = base1 + 9 * nelemx;
        element_node(16,element) = base1 + 9 * nelemx;

      end

    end
  end

  return
end
