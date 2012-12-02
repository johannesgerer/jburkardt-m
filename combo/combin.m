function cnk = combin ( n, k )

%*****************************************************************************80
%
%% COMBIN computes the combinatorial coefficient C(N,K).
%
%  Discussion:
%
%    Real arithmetic is used, and C(N,K) is computed directly, via
%    Gamma functions, rather than recursively.
%
%    C(N,K) is the number of distinct combinations of K objects
%    chosen from a set of N distinct objects.  A combination is
%    like a set, in that order does not matter.
%
%    C(N,K) = N% / ( (N-K)% * K% )
%
%  Example:
%
%    The number of combinations of 2 things chosen from 5 is 10.
%
%    C(5,2) = ( 5 * 4 * 3 * 2 * 1 ) / ( ( 3 * 2 * 1 ) * ( 2 * 1 ) ) = 10.
%
%    The actual combinations may be represented as:
%
%      (1,2), (1,3), (1,4), (1,5), (2,3),
%      (2,4), (2,5), (3,4), (3,5), (4,5).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the value of N.
%
%    Input, integer K, the value of K.
%
%    Output, real CNK, the value of C(N,K)
%
  if ( n < 0 )

    cnk = 0.0;

  elseif ( k == 0 )

    cnk = 1.0;

  elseif ( k == 1 )

    cnk = n;

  elseif ( 1 < k && k < n - 1 )

    facn = gammaln ( n + 1 );
    fack = gammaln ( k + 1 );
    facnmk = gammaln ( n - k + 1 );

    cnk = round ( exp ( facn - fack - facnmk ) );

  elseif ( k == n - 1 )

    cnk = n;

  elseif ( k == n )

    cnk = 1.0;

  else

    cnk = 0.0;

  end

  return
end
