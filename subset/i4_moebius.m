function mu = i4_moebius ( n )

%*****************************************************************************80
%
%% I4_MOEBIUS returns the value of MU(N), the Moebius function of N.
%
%  Discussion:
%
%    MU(N) is defined as follows:
%
%      MU(N) = 1 if N = 1;
%              0 if N is divisible by the square of a prime;
%              (-1)**K, if N is the product of K distinct primes.
%
%  First values:
%
%     N  MU(N)
%
%     1    1
%     2   -1
%     3   -1
%     4    0
%     5   -1
%     6    1
%     7   -1
%     8    0
%     9    0
%    10    1
%    11   -1
%    12    0
%    13   -1
%    14    1
%    15    1
%    16    0
%    17   -1
%    18    0
%    19   -1
%    20    0
%
%    As special cases, MU(N) is -1 if N is a prime, and MU(N) is 0
%    if N is a square, cube, etc.
%
%    The Moebius function MU(D) is related to Euler's totient 
%    function PHI(N):
%
%      PHI(N) = sum ( D divides N ) MU(D) * ( N / D ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the value to be analyzed.
%
%    Output, integer MU, the value of MU(N).
%    If N is less than or equal to 0, MU will be returned as -2.
%    If there was not enough internal space for factoring, MU
%    is returned as -3.
%
  if ( n <= 0 )
    mu = -2;
    return
  end

  if ( n == 1 )
    mu = 1;
    return
  end
%
%  Factor N.
%
  [ nfactor, factor, exponent, nleft ] =  i4_factor ( n  );

  if ( nleft ~= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MOEBIUS - Fatal error!\n' );
    fprintf ( 1, '  Not enough factorization space.\n' );
    mu = -3;
    return
  end

  mu = 1;

  for i = 1 : nfactor

    mu = -mu;

    if ( 1 < exponent(i) )
      mu = 0;
      return
    end

  end

  return
end
