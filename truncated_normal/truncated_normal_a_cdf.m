function cdf = truncated_normal_a_cdf ( x, mu, sigma, a )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_CDF evaluates the lower truncated Normal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2013
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
%    Input, real A, the lower truncation limit.
%
%    Output, real CDF, the value of the CDF.
%
  alpha = ( a - mu ) / sigma;
  xi = ( x - mu ) / sigma;

  alpha_cdf = normal_01_cdf ( alpha );
  xi_cdf = normal_01_cdf ( xi );

  cdf = ( xi_cdf - alpha_cdf ) / ( 1.0 - alpha_cdf );

  return
end
