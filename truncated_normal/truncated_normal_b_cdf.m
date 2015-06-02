function cdf = truncated_normal_b_cdf ( x, mu, sigma, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_B_CDF evaluates the upper truncated Normal CDF.
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
%    Input, real B, the upper truncation limit.
%
%    Output, real CDF, the value of the CDF.
%
  beta = ( b - mu ) / sigma;
  xi = ( x - mu ) / sigma;

  beta_cdf = normal_01_cdf ( beta );
  xi_cdf = normal_01_cdf ( xi );

  cdf = xi_cdf / beta_cdf;

  return
end
