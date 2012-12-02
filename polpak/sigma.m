function sigma_n = sigma ( n )

%*****************************************************************************80
%
%% SIGMA returns the value of SIGMA(N), the divisor sum.
%
%  Definition:
%
%    SIGMA(N) is the sum of the distinct divisors of N, including 1 and N.
%
%  First values:
%
%     N  SIGMA(N)
%
%     1    1
%     2    3
%     3    4
%     4    7
%     5    6
%     6   12
%     7    8
%     8   15
%     9   13
%    10   18
%    11   12
%    12   28
%    13   14
%    14   24
%    15   24
%    16   31
%    17   18
%    18   39
%    19   20
%    20   42
%
%  Formula:
%
%    SIGMA(U*V) = SIGMA(U) * SIGMA(V) if U and V are relatively prime.
%
%    SIGMA(P**K) = ( P**(K+1) - 1 ) / ( P - 1 ) if P is prime.
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
%    Input, integer N, the value to be analyzed.
%
%    Output, integer SIGMA_N, the value of SIGMA(N).  If N is less than
%    or equal to 0, SIGMA_N will be returned as 0.  If there is not
%    enough room for factoring N, SIGMA_N is returned as -1.
%
  maxfactor = 20;

  if ( n <= 0 )
    sigma_n = 0;
    return
  end

  if ( n == 1 )
    sigma_n = 1;
    return
  end
%
%  Factor N.
%
  [ nfactor, factor, power, nleft ] = i4_factor ( n );

  if ( nleft ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SIGMA - Fatal error!\n' );
    fprintf ( 1, '  Not enough factorization space.\n' );
    sigma_n = -1;
    error ( 'SIGMA - Fatal error!' );
  end

  sigma_n = 1;
  for i = 1 : nfactor
    sigma_n = ( sigma_n * ( factor(i)^( power(i) + 1 ) - 1 ) ) ...
      / ( factor(i) - 1 );
  end

  return
end
