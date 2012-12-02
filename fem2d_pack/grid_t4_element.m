function element_node = grid_t4_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_T4_ELEMENT produces an element grid of pairs of 4 node triangles.
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
%         1,  2,  5;
%         6,  5,  2;
%         2,  3,  6;
%         7,  6,  3;
%         3,  4,  7;
%         8,  7,  4;
%         5,  6,  9;
%        10,  9,  6;
%         6,  7, 10;
%        11, 10,  7;
%         7,  8, 11;
%        12, 11,  8.
%
%  Grid:
%
%   21---22---23---24
%    |\18 |\19 |\20 |
%    | \  | \  | \  |
%    |  \ |  \ |  \ |
%    | 15\| 16\| 17\|
%   11---12---13---14
%    |\ 8 |\ 9 |\10 |
%    | \  | \  | \  |
%    |  \ |  \ |  \ |
%    | 5 \|  6\|  7\|
%    1----2----3----4
%
%  Reference Element T4:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  | 4 \
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
%    15 February 2006
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
%    Output, integer ELEMENT_NODE(4,2*NELEMX*NELEMY), the nodes that form
%    each element.
%
  node_num = 4;
%
%  Node labeling:
%
%    NW----NE
%     |\   |
%     | \NC|
%     |SC\ |
%     |   \|
%    SW---SE
%
  element = 0;
 
  for j = 1 : nelemy
    for i = 1 : nelemx

      sw = i     + ( j - 1 ) * ( 3 * nelemx + 1 );
      se = sw + 1;
      sc = sw +     nelemx + 1;
      nc = sw + 2 * nelemx + 1;

      nw = sw + 3 * nelemx + 1;
      ne = sw + 3 * nelemx + 2;

      element = element + 1;
      element_node(1,element) = sw;
      element_node(2,element) = se;
      element_node(3,element) = nw;
      element_node(4,element) = sc;

      element = element + 1;
      element_node(1,element) = ne;
      element_node(2,element) = nw;
      element_node(3,element) = se;
      element_node(4,element) = nc;

    end
  end

  return
end
