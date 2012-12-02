function value = derange_enum3 ( n )

%*****************************************************************************80
%
%% DERANGE_ENUM3 returns the number of derangements of 0 through N objects.
%
%  Discussion:
%
%    A derangement of N objects is a permutation which leaves no object
%    unchanged.
%
%    A derangement of N objects is a permutation with no fixed
%    points.  If we symbolize the permutation operation by "P",
%    then for a derangment, P(I) is never equal to I.
%
%    The number of derangements of N objects is sometimes called
%    the subfactorial function, or the derangement number D(N).
%
%  Recursion:
%
%      D(0) = 1
%      D(1) = 0
%      D(2) = 1
%      D(N) = (N-1) * ( D(N-1) + D(N-2) )
%
%    or
%
%      D(0) = 1
%      D(1) = 0
%      D(N) = N * D(N-1) + (-1)**N
%
%  Formula:
%
%    D(N) = N! * ( 1 - 1/1! + 1/2! - 1/3! ... 1/N! )
%
%    Based on the inclusion/exclusion law.
%
%    D(N) = nint ( N! / E )
%
%    D(N) is the number of ways of placing N non-attacking rooks on
%    an N by N chessboard with one diagonal deleted.
%
%    Limit ( N -> Infinity ) D(N)/N! = 1 / e.
%
%    The number of permutations with exactly K items in the right
%    place is COMB(N,K) * D(N-K).
%
%  First values:
%
%     N         D(N)
%     0           1
%     1           0
%     2           1
%     3           2
%     4           9
%     5          44
%     6         265
%     7        1854
%     8       14833
%     9      133496
%    10     1334961
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the maximum number of objects to be permuted.
%
%    Output, integer VALUE, the number of derangements of N objects.
%
  e = 2.718281828459045;

  if ( n < 0 )
    value = -1;
  elseif ( n == 0 )
    value = 1;
  elseif ( n == 1 )
    value = 0;
  else
    value = round ( i4_factorial ( n ) / e );
  end

  return
end
