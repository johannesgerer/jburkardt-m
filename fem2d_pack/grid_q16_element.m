function element_node = grid_q16_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q16_ELEMENT produces a grid of 16 node quadrilaterals.
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
%         1,  2,  3,  4,  8,  9, 10, 11, 15, 16, 17, 18, 22, 23, 24, 25;
%         4,  5,  6,  7, 11, 12, 13, 14, 18, 19, 20, 21, 25, 26, 27, 28;
%        22, 23, 24, 25, 29, 30, 31, 32, 36, 37, 38, 39, 43, 44, 45, 46;
%        25, 26, 27, 28, 32, 33, 34, 35, 39, 40, 41, 42, 46, 47, 48, 49.
%
%  Grid:
%
%   43-44-45-46-47-48-49
%    |        |        |
%    |        |        |
%   36 37 38 39 40 41 42
%    |        |        |
%    |        |        |
%   29 30 31 32 33 34 35
%    |        |        |
%    | 3      | 4      |
%   22-23-24-25-26-27-28
%    |        |        |
%    |        |        |
%   15 16 17 18 19 20 21
%    |        |        |
%    |        |        |
%    8  9 10 11 12 13 14
%    |        |        |
%    | 1      | 2      |
%    1--2--3--4--5--6--7
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
%    Output, integer ELEMENT_NODE(16,NELEMX*NELEMY), the nodes that form
%    each element.
%
  element = 0;

  for j = 1 : nelemy
    for i = 1 : nelemx

      base = ( j - 1 ) * 3 * ( 3 * nelemx + 1 ) + 3 * i - 2;

      element = element + 1;

      element_node( 1,element) = base;
      element_node( 2,element) = base                          + 1;
      element_node( 3,element) = base                          + 2;
      element_node( 4,element) = base                          + 3;
      element_node( 5,element) = base +     ( 3 * nelemx + 1 );
      element_node( 6,element) = base +     ( 3 * nelemx + 1 ) + 1;
      element_node( 7,element) = base +     ( 3 * nelemx + 1 ) + 2;
      element_node( 8,element) = base +     ( 3 * nelemx + 1 ) + 3;
      element_node( 9,element) = base + 2 * ( 3 * nelemx + 1 );
      element_node(10,element) = base + 2 * ( 3 * nelemx + 1 ) + 1;
      element_node(11,element) = base + 2 * ( 3 * nelemx + 1 ) + 2;
      element_node(12,element) = base + 2 * ( 3 * nelemx + 1 ) + 3;
      element_node(13,element) = base + 3 * ( 3 * nelemx + 1 );
      element_node(14,element) = base + 3 * ( 3 * nelemx + 1 ) + 1;
      element_node(15,element) = base + 3 * ( 3 * nelemx + 1 ) + 2;
      element_node(16,element) = base + 3 * ( 3 * nelemx + 1 ) + 3;

    end
  end

  return
end

