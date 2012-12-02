function element_node = grid_q9_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q9_ELEMENT produces a grid of 9 node quadrilaterals.
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
%         1,  3, 17, 15,  2, 10, 16,  8,  9;
%         3,  5, 19, 17,  4, 12, 18, 10, 11;
%         5,  7, 21, 19,  6, 14, 20, 12, 13;
%        15, 17, 31, 29, 16, 24, 30, 22, 23;
%        17, 19, 33, 31, 18, 26, 32, 24, 25;
%        19, 21, 35, 33, 20, 28, 34, 26, 27.
%
%  Grid:
%
%   29---30---31---32---33---34---35
%    |    .    |    .    |    .    |
%    |    .    |    .    |    .    |
%   22 . 23 . 24 . 25 . 26 . 27 . 28
%    |    .    |    .    |    .    |
%    | 4  .    | 5  .    | 6  .    |
%   15---16---17---18---19---20---21
%    |    .    |    .    |    .    |
%    |    .    |    .    |    .    |
%    8 .  9 . 10 . 11 . 12 . 13 . 14
%    |    .    |    .    |    .    |
%    | 1  .    | 2  .    | 3  .    |
%    1----2----3----4----5----6----7
%
%  Reference Element Q9:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8  9  6
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
%    Output, integer ELEMENT_NODE(9,NELEMX*NELEMY), the nodes that form
%    each element.
%

%
%  Node labeling:
%
%    NW----N----NE
%     |          |
%     W    C     E
%     |          |
%    SW----S----SE
%
  element = 0;

  for j = 1 : nelemy
    for i = 1 : nelemx

      sw = 2 * ( j - 1 )  * ( 2 * nelemx + 1 ) + 2 * ( i - 1 ) + 1;
      w  = sw +               2 * nelemx + 1;
      nw = sw +         2 * ( 2 * nelemx + 1 );

      s  = sw + 1;
      c  = sw + 1 +               2 * nelemx + 1;
      n  = sw + 1 +         2 * ( 2 * nelemx + 1 );

      se = sw + 2;
      e  = sw + 2 +               2 * nelemx + 1;
      ne = sw + 2 +         2 * ( 2 * nelemx + 1 );

      element = element + 1;

      element_node(1,element) = sw;
      element_node(2,element) = se;
      element_node(3,element) = ne;
      element_node(4,element) = nw;
      element_node(5,element) = s;
      element_node(6,element) = e;
      element_node(7,element) = n;
      element_node(8,element) = w;
      element_node(9,element) = c;

    end
  end

  return
end
