function element_node = grid_t10_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_T10_ELEMENT produces a grid of pairs of 10 node triangles.
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
%         1,  2,  3,  4, 10, 16, 22, 15,  8,  9;
%        25, 24, 23, 22, 16, 10,  4, 11, 18, 17;
%         4,  5,  6,  7, 13, 19, 25, 18, 11, 12;
%        28, 27, 26, 25, 19, 13,  7, 14, 21, 20;
%        22, 23, 24, 25, 31, 37, 43, 36, 29, 30;
%        46, 45, 44, 43, 37, 31, 25, 32, 39, 38;
%        25, 26, 27, 28, 34, 40, 46, 39, 31, 33;
%        49, 48, 47, 46, 40, 34, 28, 35, 42, 41.
%
%  Grid:
%
%   43-44-45-46-47-48-49
%    |\     6 |\     8 |
%    | \      | \      |
%   36 37 38 39 40 41 42
%    |   \    |   \    |
%    |    \   |    \   |
%   29 30 31 32 33 34 35
%    |      \ |      \ |
%    | 5     \| 7     \|
%   22-23-24-25-26-27-28
%    |\     2 |\     4 |
%    | \      | \      |
%   15 16 17 18 19 20 21
%    |   \    |   \    |
%    |    \   |    \   |
%    8  9 10 11 12 13 14
%    |      \ |      \ |
%    | 1     \| 3     \|
%    1--2--3--4--5--6--7
%
%  Reference Element T10:
%
%    |
%    1  10
%    |  |\
%    |  | \
%    |  8  9
%    |  |   \
%    S  |    \
%    |  5  6  7
%    |  |      \
%    |  |       \
%    0  1--2--3--4
%    |
%    +--0----R---1-->
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
%    2 * NELEMX * NELEMY.
%
%    Output, integer ELEMENT_NODE(10,2*NELEMX*NELEMY), the nodes that form
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
      element_node( 5,element) = base +     ( 3 * nelemx + 1 ) + 2;
      element_node( 6,element) = base + 2 * ( 3 * nelemx + 1 ) + 1;
      element_node( 7,element) = base + 3 * ( 3 * nelemx + 1 );
      element_node( 8,element) = base + 2 * ( 3 * nelemx + 1 );
      element_node( 9,element) = base +     ( 2 * nelemx + 1 ) + 2;
      element_node(10,element) = base +     ( 2 * nelemx + 1 ) + 3;

      element = element + 1;

      element_node( 1,element) = base + 3 * ( 3 * nelemx + 1 ) + 3;
      element_node( 2,element) = base + 3 * ( 3 * nelemx + 1 ) + 2;
      element_node( 3,element) = base + 3 * ( 3 * nelemx + 1 ) + 1;
      element_node( 4,element) = base + 3 * ( 3 * nelemx + 1 );
      element_node( 5,element) = base + 2 * ( 3 * nelemx + 1 ) + 1;
      element_node( 6,element) = base +     ( 3 * nelemx + 1 ) + 2;
      element_node( 7,element) = base                          + 3;
      element_node( 8,element) = base +     ( 3 * nelemx + 1 ) + 3;
      element_node( 9,element) = base + 2 * ( 3 * nelemx + 1 ) + 3;
      element_node(10,element) = base + 2 * ( 3 * nelemx + 1 ) + 2;

    end
  end

  return
end
