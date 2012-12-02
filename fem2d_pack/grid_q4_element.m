function element_node = grid_q4_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q4_ELEMENT produces a grid of 4 node quadrilaterals.
%
%  Discussion:
%
%    For each element, the nodes are listed in counter-clockwise order.
%
%  Example:
%
%    Input:
%
%      NELEMX = 3, NELEMY = 2
%
%    Output:
%
%      ELEMENT_NODE =
%         1, 2,  6,  5;
%         2, 3,  7,  6;
%         3, 4,  8,  7;
%         5, 6, 10,  9;
%         6, 7, 11, 10;
%         7, 8, 12, 11.
%
%  Grid:
%
%    9---10---11---12
%    |    |    |    |
%    |    |    |    |
%    |  4 |  5 |  6 |
%    |    |    |    |
%    5----6----7----8
%    |    |    |    |
%    |    |    |    |
%    |  1 |  2 |  3 |
%    |    |    |    |
%    1----2----3----4
%
%  Reference Element Q4:
%
%    |
%    1  4-----3
%    |  |     |
%    |  |     |
%    S  |     |
%    |  |     |
%    |  |     |
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
%    14 April 2005
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

%
%  Node labeling:
%
%    NW---NE
%     |    |
%    SW---SE
%
  element = 0;

  for j = 1 : nelemy
    for i = 1 : nelemx

      sw = i     + ( j - 1 ) * ( nelemx + 1 );
      se = i + 1 + ( j - 1 ) * ( nelemx + 1 );
      nw = i     +   j       * ( nelemx + 1 );
      ne = i + 1 +   j       * ( nelemx + 1 );

      element = element + 1;

      element_node(1,element) = sw;
      element_node(2,element) = se;
      element_node(3,element) = ne;
      element_node(4,element) = nw;

    end
  end

  return
end
