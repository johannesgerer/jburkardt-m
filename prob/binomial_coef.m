function cnk = binomial_coef ( n, k )

%*****************************************************************************80
%
%% BINOMIAL_COEF computes the Binomial coefficient C(N,K).
%
%  Discussion:
%
%    The value is calculated in such a way as to avoid overflow and
%    roundoff.  The calculation is done in integer arithmetic.
%
%    CNK = C(N,K) = N! / ( K! * (N-K)! )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    M L Wolfson and H V Wright,
%    Combinatorial of M Things Taken N at a Time,
%    ACM Algorithm 160,
%    Communications of the ACM,
%    April, 1963.
%
%  Parameters:
%
%    Input, integer N, K, are the values of N and K.
%
%    Output, integer CNK, the number of combinations of N
%    things taken K at a time.
%
  mn = min ( k, n-k );

  if ( mn < 0 )

    cnk = 0;

  elseif ( mn == 0 )

    cnk = 1;

  else

    mx = max ( k, n-k );
    cnk = mx + 1;

    for i = 2 : mn
      cnk = round ( ( cnk * ( mx + i ) ) / i );
    end

  end

  return
end
