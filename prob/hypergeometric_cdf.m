function cdf = hypergeometric_cdf ( x, n, m, l )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_CDF evaluates the Hypergeometric CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the CDF.
%
%    Input, integer N, the number of balls selected.
%    0 <= N <= L.
%
%    Input, integer M, the number of white balls in the population.
%    0 <= M <= L.
%
%    Input, integer L, the number of balls to select from.
%    0 <= L.
%
%    Output, real CDF, the value of the CDF.
%
  c1_log = binomial_coef_log ( l - m, n );
  c2_log = binomial_coef_log ( l, n );

  pdf = exp ( c1_log - c2_log );
  cdf = pdf;

  for x2 = 0 : x - 1

    pdf = pdf * ( m - x2 ) * ( n - x2 ) ...
      / ( ( x2 + 1 ) * ( l - m - n + x2 + 1 ) );

    cdf = cdf + pdf;

  end

  return
end
