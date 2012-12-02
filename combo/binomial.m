function value = binomial ( n, k )

%*****************************************************************************80
%
%% BINOMIAL computes the binomial coefficient C(N,K).
%
%  Discussion:
%
%    BINOMIAL(N,K) = C(N,K) = N% / ( K% * (N-K)% )
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
%  Reference:
%
%    ML Wolfson, HV Wright,
%    Algorithm 160:
%    Combinatorial of M Things Taken N at a Time,
%    Communications of the ACM,
%    Volume 6, Number 4, April 1963, page 161.
%
%  Parameters:
%
%    Input, integer N, K, are the values of N and K.
%
%    Output, integer VALUE, the number of combinations of N
%    things taken K at a time.
%
  mn = min ( k, n - k );

  if ( mn < 0 )

    icnk = 0;

  elseif ( mn == 0 )

    icnk = 1;

  else

    mx = max ( k, n - k );
    icnk = mx + 1;

    for i = 2 : mn
      icnk = ( icnk * ( mx + i ) ) / i;
    end

  end

  value = icnk;

  return
end
