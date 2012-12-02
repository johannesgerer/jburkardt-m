function ndiv = omega ( n )

%*****************************************************************************80
%
%% OMEGA returns OMEGA(N), the number of distinct prime divisors of N.
%
%  First values:
%
%     N   OMEGA(N)
%
%     1    1
%     2    1
%     3    1
%     4    1
%     5    1
%     6    2
%     7    1
%     8    1
%     9    1
%    10    2
%    11    1
%    12    2
%    13    1
%    14    2
%    15    2
%    16    1
%    17    1
%    18    2
%    19    1
%    20    2
%
%  Formula:
%
%    If N = 1, then
%
%      OMEGA(N) = 1
%
%    else if the prime factorization of N is
%
%      N = P1**E1 * P2**E2 * ... * PM**EM,
%
%    then
%
%      OMEGA(N) = M
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the value to be analyzed.  N must be 1 or
%    greater.
%
%    Output, integer NDIV, the value of OMEGA(N).  But if N is 0 or
%    less, NDIV is returned as 0, a nonsense value.  If there is
%    not enough room for factoring, NDIV is returned as -1.
%
  if ( n <= 0 )
    ndiv = 0;
    return
  end

  if ( n == 1 )
    ndiv = 1;
    return
  end
%
%  Factor N.
%
  [ nfactor, factor, power, nleft ] = i4_factor ( n );

  if ( nleft ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'OMEGA - Fatal error!\n' );
    fprintf ( 1, '  Not enough factorization space.\n' );
    error ( 'OMEGA - Fatal error!' );
  end

  ndiv = nfactor;

  return
end
