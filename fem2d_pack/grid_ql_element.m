function element_node = grid_ql_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_QL_ELEMENT produces a grid of 6 node quadratics/linears.
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
%         1,  2,  3,  8,  9, 10;
%         3,  4,  5, 10, 11, 12;
%         5,  6,  7, 12, 13, 14;
%         8,  9, 10, 15, 16, 17;
%        10, 11, 12, 17, 18, 19;
%        12, 13, 14, 19, 20, 21.
%
%  Grid:
%
%   15---16---17---18---19---20---21
%    |         |         |         |
%    |         |         |         |
%    |    4    |    5    |    6    |
%    |         |         |         |
%    |         |         |         |
%    8----9---10---11---12---13---14
%    |         |         |         |
%    |         |         |         |
%    |    1    |    2    |    3    |
%    |         |         |         |
%    |         |         |         |
%    1----2----3----4----5----6----7
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
%    NELEMX * NELEMY.  X will the the "quadratic direction", and
%    Y will be the "linear direction".
%
%    Output, integer ELEMENT_NODE(6,NELEMX*NELEMY), the nodes that form
%    each element.
%
  element = 0;

  for j = 1 : nelemy
    for i = 1 : nelemx

      base = ( j - 1 )  * ( 2 * nelemx + 1 ) + 2 * i - 1;

      element = element + 1;

      element_node(1,element) = base;
      element_node(2,element) = base + 1;
      element_node(3,element) = base + 2;
      element_node(4,element) = base + ( 2 * nelemx + 1 );
      element_node(5,element) = base + ( 2 * nelemx + 1 ) + 1;
      element_node(6,element) = base + ( 2 * nelemx + 1 ) + 2;

    end
  end

  return
end
