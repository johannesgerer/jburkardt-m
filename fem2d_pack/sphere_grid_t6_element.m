function element_node = sphere_grid_t6_element ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_T6_ELEMENT produces a T6 sphere grid.
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
%        10,  8,  1,  9,  3,  4;
%        12, 10,  1, 11,  5,  6;
%         8, 12,  1, 13,  7,  2;
%         8, 10, 20,  9, 15, 14;
%        22, 20, 10, 21, 15, 16;
%        10, 12, 22, 11, 17, 16;
%        24, 22, 12, 23, 17, 18;
%        12,  8, 24, 13, 19, 18;
%        20, 24,  8, 25, 19, 14;
%        20, 22, 32, 21, 27, 26;
%        34, 32, 22, 33, 27, 28;
%        22, 24, 34, 23, 29, 28;
%        36, 34, 24, 35, 29, 30;
%        24, 20, 36, 25, 31, 30;
%        32, 36, 20, 37, 31, 26;
%        32, 34, 44, 33, 39, 38;
%        34, 36, 44, 35, 41, 40;
%        36, 32, 44, 37, 43, 42;
%
%  Grid:
%
%   44    44    44
%    |\    |\    |\
%   38 39 40 41 42 43 
%    |    \|    \|    \
%   32-33-34-35-36-37-32
%    |\    |\    |\    |
%   26 27 28 29 30 31 26
%    |    \|    \|    \|
%   20-21-22-23-24-25-20
%    |\    |\    |\    |
%   14 15 16 17 18 19 14
%    |    \|    \|    \|
%    8--9-10-11-12-13--8
%     \    |\    |\    |
%       3  4  5  6  7  2
%         \|    \|    \|
%          1     1     1
%
%  Reference Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2006
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
%    Output, integer ELEMENT_NODE(6,4*NELEMX*NELEMY-2*NELEMX+2), 
%    the nodes that form each element.
%
  element_order = 6;
  element = 0;

  for j = 1 : nelemy

    base1 = ( j - 1 ) * 2 * ( 2 * nelemx ) + 2 - 2 * nelemx;

    for i = 1 : nelemx

      base2 = base1 + 2 * ( i - 1 );

      sw = base2;
      s = base2 + 1;
      if ( i < nelemx )
        se = base2 + 2;
      else
        se = base1;
      end

      w = sw + 2 * nelemx;
      c = s  + 2 * nelemx;
      e = se + 2 * nelemx;

      nw = w + 2 * nelemx;
      n  = c + 2 * nelemx;
      ne = e + 2 * nelemx;

      if ( j == 1 )
        sw = 1;
        s  = 1;
        se = 1;
      elseif ( j == nelemy )
        nw = base1 + 4 * nelemx;
        n  = base1 + 4 * nelemx;
        ne = base1 + 4 * nelemx;
      end

      if ( 1 < j )
        element = element + 1;
        element_node(1,element) = sw;
        element_node(2,element) = se;
        element_node(3,element) = nw;
        element_node(4,element) = s;
        element_node(5,element) = c;
        element_node(6,element) = w;
      end

      if ( j < nelemy )
        element = element + 1;
        element_node(1,element) = ne;
        element_node(2,element) = nw;
        element_node(3,element) = se;
        element_node(4,element) = n;
        element_node(5,element) = c;
        element_node(6,element) = e;
      end


    end

  end

  return
end
