function element_node = grid_q8_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q8_ELEMENT produces a grid of 8 node quadrilaterals.
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
%         1,  3, 14, 12,  2,  9, 13,  8;
%         3,  5, 16, 14,  4, 10, 15,  9;
%         5,  7, 18, 16,  6, 11, 17, 10;
%        12, 14, 25, 23, 13, 20, 24, 19;
%        14, 16, 27, 25, 15, 21, 26, 20;
%        16, 18, 29, 27, 17, 22, 28, 21.
%
%  Diagram:
%
%   23---24---25---26---27---28---29
%    |         |         |         |
%    |         |         |         |
%   19        20        21        22
%    |         |         |         |
%    | 4       | 5       | 6       |
%   12---13---14---15---16---17---18
%    |         |         |         |
%    |         |         |         |
%    8         9        10        11
%    |         |         |         |
%    | 1       | 2       | 3       |
%    1----2----3----4----5----6----7
%
%  Reference Element Q8:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8     6
%    |  |     |
%    |  |     |
%    0  1--5--2
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
%    Output, integer ELEMENT_NODE(8,NELEMX*NELEMY), the nodes that form
%    each element.
%

%
%  Node labeling:
%
%    NW----N----NE
%     |          |
%     W   (C)    E
%     |          |
%    SW----S----SE
%
  element = 0;

  for j = 1 : nelemy
    for i = 1 : nelemx

      sw = ( j - 1 )  * ( 3 * nelemx + 2 ) + 2 * i - 1;
      w  = sw + 2 * nelemx + 2 - i;
      nw = sw + 3 * nelemx + 2;

      s =  sw + 1;
      n =  sw + ( 3 * nelemx + 2 ) + 1;

      se = sw + 2;
      e  = sw + 2 * nelemx + 2 - i + 1;
      ne = sw + ( 3 * nelemx + 2 ) + 2;

      element = element + 1;

      element_node(1,element) = sw;
      element_node(2,element) = se;
      element_node(3,element) = ne;
      element_node(4,element) = nw;
      element_node(5,element) = s;
      element_node(6,element) = e;
      element_node(7,element) = n;
      element_node(8,element) = w;

    end
  end

  return
end

