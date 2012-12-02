function rank = subset_gray_rank ( n, a )

%*****************************************************************************80
%
%% SUBSET_GRAY_RANK ranks a subset of an N set, using the Gray code ordering.
%
%  Example:
%
%    N = 4
%
%       A       Rank
%    -------   -----
%
%    0 0 0 0       1
%    1 0 0 0       2
%    1 1 0 0       3
%    0 1 0 0       4
%    0 1 1 0       5
%    1 1 1 0       6
%    1 0 1 0       7
%    0 0 1 0       8
%    0 0 1 1       9
%    1 0 1 1      10
%    1 1 1 1      11
%    0 1 1 1      12
%    0 1 0 1      13
%    1 1 0 1      14
%    1 0 0 1      15
%    0 0 0 1      16
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the total set from which
%    subsets will be drawn.
%
%    Input, integer A(N); A(I) is 1 if element I is in the set,
%    and 0 otherwise.
%
%    Output, integer RANK, the rank of the subset in the Gray code ordering.
%
  gray = ubvec_to_ui4 ( n, a );

  rank = gray_rank2 ( gray );

  rank = rank + 1;

  return
end
