function g = simplex_grid_index_next ( m, n, g )

%*****************************************************************************80
%
%% SIMPLEX_GRID_INDEX_NEXT returns the next simplex grid index.
%
%  Discussion:
%
%    The vector G has dimension M+1.  The first M entries may be regarded
%    as grid coordinates.  These coordinates must have a sum between 0 and N.
%    The M+1 entry contains the remainder, that is N minus the sum of the
%    first M coordinates.
%
%    Each time the function is called, it is given a current grid index, and
%    computes the next one.  The very first index is all zero except for a 
%    final value of N, and the very last index has all zero except for an'
%    intial value of N.
%
%    For example, here are the coordinates in order for M = 3, N = 3:
%
%     0  0 0 0 3
%     1  0 0 1 2
%     2  0 0 2 1
%     3  0 0 3 0
%     4  0 1 0 2
%     5  0 1 1 1
%     6  0 1 2 0
%     7  0 2 0 1
%     8  0 2 1 0
%     9  0 3 0 0
%    10  1 0 0 2
%    11  1 0 1 1
%    12  1 0 2 0
%    13  1 1 0 1
%    14  1 1 1 0
%    15  1 2 0 0
%    16  2 0 0 1
%    17  2 0 1 0
%    18  2 1 0 0
%    19  3 0 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of subintervals.
%
%    Input/output, integer G(M+1), the current, and then the next, grid index.
%
  g = comp_next_grlex ( m + 1, g );

  return
end

