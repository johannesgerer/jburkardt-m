function number = comp_enum ( n, k )

%*****************************************************************************80
%
%% COMP_ENUM returns the number of compositions of the integer N into K parts.
%
%  Discussion:
%
%    A composition of the integer N into K parts is an ordered sequence
%    of K nonnegative integers which sum to N.  The compositions (1,2,1)
%    and (1,1,2) are considered to be distinct.
%
%    The 28 compositions of 6 into three parts are:
%
%      6 0 0,  5 1 0,  5 0 1,  4 2 0,  4 1 1,  4 0 2,
%      3 3 0,  3 2 1,  3 1 2,  3 0 3,  2 4 0,  2 3 1,
%      2 2 2,  2 1 3,  2 0 4,  1 5 0,  1 4 1,  1 3 2,
%      1 2 3,  1 1 4,  1 0 5,  0 6 0,  0 5 1,  0 4 2,
%      0 3 3,  0 2 4,  0 1 5,  0 0 6.
%
%    The formula for the number of compositions of N into K parts is
%
%      Number = ( N + K - 1 )! / ( N! * ( K - 1 )! )
%
%    Describe the composition using N '1's and K-1 dividing lines '|'.
%    The number of distinct permutations of these symbols is the number
%    of compositions.  This is equal to the number of permutations of
%    N+K-1 things, with N identical of one kind and K-1 identical of another.
%
%    Thus, for the above example, we have:
%
%      Number = ( 6 + 3 - 1 )! / ( 6! * (3-1)! ) = 28
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input, integer N, the integer whose compositions are desired.
%
%    Input, integer K, the number of parts in the composition.
%
%    Output, integer NUMBER, the number of compositions of N
%    into K parts.
%
  number = i4_choose ( n + k - 1, n );

  return
end
