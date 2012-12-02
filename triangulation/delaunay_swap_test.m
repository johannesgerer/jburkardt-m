function swap = delaunay_swap_test ( xy )

%*****************************************************************************80
%
%% DELAUNAY_SWAP_TEST performs the Delaunay swap test.
%
%  Discussion:
%
%    The current triangles are formed by nodes (1,2,3) and (1,3,4).
%    if a swap is recommended, the new triangles will be (1,2,4) and (2,3,4).
%
%      4     ?     4
%     / \         /|\
%    1---3  ==>  1 | 3
%     \ /         \|/
%      2           2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Graham Carey,
%    Computational Grids:
%    Generation, Adaptation and Solution Strategies,
%    Taylor and Francis, 1997,
%    ISBN13: 978-1560326359,
%    LC: QA377.C32.
%
%  Parameters:
%
%    Input, real XY(2,4), the coordinates of four points.
%
%    Output, logical SWAP, is TRUE if the triangles (1,2,4) and (2,3,4)
%    are to replace triangles (1,2,3) and (1,3,4).
%
  x13 = xy(1,1) - xy(1,3);
  x14 = xy(1,1) - xy(1,4);
  x23 = xy(1,2) - xy(1,3);
  x24 = xy(1,2) - xy(1,4);

  y13 = xy(2,1) - xy(2,3);
  y14 = xy(2,1) - xy(2,4);
  y23 = xy(2,2) - xy(2,3);
  y24 = xy(2,2) - xy(2,4);

  a = x13 * x23 + y13 * y23;
  b = x24 * y14 - x14 * y24;
  c = x23 * y13 - x13 * y23;
  d = x24 * x14 + y14 * y24;
%
%  The reference gives two initial tests before the
%  main one.  However, there seems to be an error
%  in at least one of these tests.  Since they are
%  intended to avoid error in borderline cases, but
%  instead cause real error in common cases, they are
%  omitted for now.
%
% if ( 0.0 <= a & 0.0 <= d )
%   swap = 1;
% elseif ( a < d & d < 0.0 )
%   swap = 1;
%  elseif...

  if ( a * b < c * d )
    swap = 1;
  else
    swap = 0;
  end

  return
end
