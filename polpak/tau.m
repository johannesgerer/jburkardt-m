function taun = tau ( n, taun )

%*****************************************************************************80
%
%% TAU returns the value of TAU(N), the number of distinct divisors of N.
%
%  Discussion:
%
%    TAU(N) is the number of divisors of N, including 1 and N.
%
%  First values:
%
%     N   TAU(N)
%
%     1    1
%     2    2
%     3    2
%     4    3
%     5    2
%     6    4
%     7    2
%     8    4
%     9    3
%    10    4
%    11    2
%    12    6
%    13    2
%    14    4
%    15    4
%    16    5
%    17    2
%    18    6
%    19    2
%    20    6
%
%  Formula:
%
%    If the prime factorization of N is
%
%      N = P1**E1 * P2**E2 * ... * PM**EM,
%
%    then
%
%      TAU(N) = ( E1 + 1 ) * ( E2 + 1 ) * ... * ( EM + 1 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2004
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
%    Output, integer TAUN, the value of TAU(N).  But if N is 0 or
%    less, TAUN is returned as 0, a nonsense value.  If there is
%    not enough room for factoring, TAUN is returned as -1.
%
  if ( n <= 0 )
    taun = 0;
    return
  end

  if ( n == 1 )
    taun = 1;
    return
  end
%
%  Factor N.
%
  [ nfactor, factor, power, nleft ] = i4_factor ( n );

  if ( nleft ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TAU - Fatal error!\n' );
    fprintf ( 1, '  Not enough factorization space.\n' );
    taun = -1;
    error ( 'TAU - Fatal error!' );
  end

  taun = 1;
  for i = 1 : nfactor
    taun = taun * ( power(i) + 1 );
  end

  return
end
