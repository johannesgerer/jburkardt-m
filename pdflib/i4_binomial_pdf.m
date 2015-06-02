function value = i4_binomial_pdf ( n, p, k )

%*****************************************************************************80
%
%% I4_BINOMIAL_PDF evaluates the binomial PDF.
%
%  Discussion:
%
%    pdf(n,p,k) = C(n,k) p^k (1-p)^(n-k)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the number of binomial trials.
%    0 < N.
%
%    Input, real P, the probability of a success in one trial.
%
%    Input, integer K, the number of successes.
%
%    Output, real VALUE, the probability of K successes
%    in N trials with a per-trial success probability of P.
%
  if ( k < 0 )
    value = 0.0;
  elseif ( k <= n )
    value = r8_choose ( n, k ) * p ^ k * ( 1.0 - p ) ^ k;
  else
    value = 0.0;
  end

  return
end
