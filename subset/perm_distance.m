function k = perm_distance ( n, a, b )

%*****************************************************************************80
%
%% PERM_DISTANCE computes the Ulam metric distance of two permutations.
%
%  Discussion:
%
%    If we let N be the order of the permutations A and B, and L(P) be
%    the length of the longest ascending subsequence of a permutation P,
%    then the Ulam metric distance between A and B is
%
%      N - L ( A * inverse ( B ) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the permutation.
%
%    Input, integer A(N), B(N), the permutations to be examined.
%
%    Output, integer K, the Ulam metric distance between A and B.
%
  binv = perm_inverse ( n, b );

  c = perm_mul ( n, a, binv );

  [ length, c2 ] = perm_ascend ( n, c );

  k = n - length;

  return
end
