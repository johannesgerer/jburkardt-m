function element_node = grid_q12_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q12_ELEMENT produces a grid of 12 node quadrilaterals.
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
%         1,  2,  3,  4, 11, 12, 15, 16, 19, 20, 21, 22;
%         4,  5,  6,  7, 12, 13, 16, 17, 22, 23, 24, 25;
%         7,  8,  9, 10, 13, 14, 17, 18, 25, 26, 27, 28;
%        19, 20, 21, 22, 29, 30, 33, 34, 37, 38, 39, 40;
%        22, 23, 24, 25, 30, 31, 34, 35, 40, 41, 42, 43;
%        25, 26, 27, 28, 31, 32, 35, 36, 43, 44, 45, 46.
%
%  Grid:
%
%   37-38-39-40-41-42-43-44-45-46
%    |        |        |        |
%   33       34       35       36
%    |        |        |        |
%   29       30       31       32
%    | 4      | 5      | 6      |
%   19-20-21-22-23-24-25-26-27-28
%    |        |        |        |
%   15       16       17       18
%    |        |        |        |
%   11       12       13       14
%    | 1      | 2      | 3      |
%    1--2--3--4--5--6--7--8--9-10
%
%  Reference Element Q12:
%
%    |
%    1  9-10-11-12
%    |  |        |
%    |  7        8
%    S  |        |
%    |  5        6
%    |  |        |
%    0  1--2--3--4
%    |
%    +--0---R---1-->
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
%    Output, integer ELEMENT_NODE(12,NELEMX*NELEMY), the nodes that form
%    each element.
%
  element = 0;

  for j = 1 : nelemy
    for i = 1 : nelemx

      base = ( j - 1 )  * ( 5 * nelemx + 3 ) + 1;

      element = element + 1;

      element_node( 1,element) =  base + ( i - 1 ) * 3;
      element_node( 2,element) =  base + ( i - 1 ) * 3 + 1;
      element_node( 3,element) =  base + ( i - 1 ) * 3 + 2;
      element_node( 4,element) =  base + ( i - 1 ) * 3 + 3;

      element_node( 5,element) =  base + 3 * nelemx + i;
      element_node( 6,element) =  base + 3 * nelemx + i + 1;

      element_node( 7,element) =  base + 4 * nelemx + i + 1;
      element_node( 8,element) =  base + 4 * nelemx + i + 2;

      element_node( 9,element) =  base + 5 * nelemx + 3 * i;
      element_node(10,element) = base + 5 * nelemx + 3 * i + 1;
      element_node(11,element) = base + 5 * nelemx + 3 * i + 2;
      element_node(12,element) = base + 5 * nelemx + 3 * i + 3;

    end
  end

  return
end
