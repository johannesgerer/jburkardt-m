function cdf = truncated_normal_ab_cdf ( x, mu, sigma, a, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_AB_CDF evaluates the truncated Normal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, real MU, SIGMA, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, B, the lower and upper truncation limits.
%
%    Output, real CDF, the value of the CDF.
%
  alpha = ( a - mu ) / sigma;
  beta = ( b - mu ) / sigma;
  xi = ( x - mu ) / sigma;

  alpha_cdf = normal_01_cdf ( alpha );
  beta_cdf = normal_01_cdf ( beta );
  xi_cdf = normal_01_cdf ( xi );

  cdf = ( xi_cdf - alpha_cdf ) / ( beta_cdf - alpha_cdf );

  return
end
