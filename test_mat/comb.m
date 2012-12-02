function value = comb ( n, k )

%*****************************************************************************80
%
%% COMB computes the combinatorial coefficient C(N,K).
%
%  Formula:
%
%    COMB(N,K) = N! / ( K! * (N-K)! )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, K, the quantities that determine the coefficient.
%
%    Output, real VALUE, the combinatorial coefficient.
%
  if ( k < 0 | n < k )

    value = 0.0;

  elseif ( k == 0 | k == n )

    value = 1.0;

  elseif ( k == 1 | k == n - 1 )

    value = n;

  else

    value = 1.0;

    for i = 1 : k
      value = value * ( n + 1 - i ) / i;
    end

  end

  return
end
