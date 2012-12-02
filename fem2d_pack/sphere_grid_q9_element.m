function element_node = sphere_grid_q9_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_Q9_ELEMENT produces a Q9 sphere grid.
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
%         1,  1, 10,  8,  1,  4,  9,  2,  3;
%         1,  1, 12, 10,  1,  6, 11,  4,  5;
%         1,  1,  8, 12,  1,  2, 13,  6,  7;
%         8, 10, 22, 20,  9, 16, 21, 14, 15;
%        10, 12, 24, 22, 11, 18, 23, 16, 17;
%        12,  8, 20, 24, 13, 14, 25, 18, 19;
%        20, 22, 34, 32, 21, 28, 33, 26, 27;
%        22, 24, 36, 34, 23, 30, 35, 28, 29;
%        24, 20, 32, 36, 25, 26, 37, 30, 31;
%        32, 34, 44, 44, 33, 40, 44, 38, 39;
%        34, 36, 44, 44, 35, 42, 44, 40, 41;
%        36, 32, 44, 44, 37, 38, 44, 42, 43;
%
%  Grid:
%
%   44-44-44-44-44-44-44
%    |     |     |     |
%   38 39 40 41 42 43 38
%    |     |     |     |
%   32-33-34-35-36-37-32
%    |     |     |     |
%   26 27 28 29 30 31 26
%    |     |     |     |
%   20-21-22-23-24-25-20
%    |     |     |     |
%   14 15 16 17 18 19 14
%    |     |     |     |
%    8--9-10-11-12-13--8
%    |     |     |     |
%    2  3  4  5  6  7  2
%    |     |     |     |
%    1--1--1--1--1--1--1
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
%    Output, integer ELEMENT_NODE(9,4*NELEMX*NELEMY-2*NELEMX+2), 
%    the nodes that form each element.
%
  element_order = 9;
  element = 0;

  for j = 1 : nelemy

    base1 = ( j - 1 ) * 2 * ( 2 * nelemx ) + 2 - 2 * nelemx;

    for i = 1 : nelemx

      base2 = base1 + 2 * ( i - 1 );

      element = element + 1;

      element_node(1,element) = base2;
      element_node(5,element) = base2 + 1;

      if ( i < nelemx )
        element_node(2,element) = base2 + 2;
      else
        element_node(2,element) = base1;
      end

      element_node(8,element) = element_node(1,element) + 2 * nelemx;
      element_node(9,element) = element_node(5,element) + 2 * nelemx;
      element_node(6,element) = element_node(2,element) + 2 * nelemx;

      element_node(4,element) = element_node(8,element) + 2 * nelemx;
      element_node(7,element) = element_node(9,element) + 2 * nelemx;
      element_node(3,element) = element_node(6,element) + 2 * nelemx;

      if ( j == 1 )

        element_node(1,element) = 1;
        element_node(5,element) = 1;
        element_node(2,element) = 1;

      elseif ( j == nelemy )

        element_node(4,element) = base1 + 4 * nelemx;
        element_node(7,element) = base1 + 4 * nelemx;
        element_node(3,element) = base1 + 4 * nelemx;

      end

    end

  end

  return
end
