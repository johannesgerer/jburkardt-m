function cdf = normal_truncated_b_cdf ( x, mu, s, b )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_B_CDF evaluates the upper truncated Normal CDF.
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
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real B, the upper truncation limit.
%
%    Output, real CDF, the value of the CDF.
%
  beta = ( b - mu ) / s;
  xi = ( x - mu ) / s;

  beta_cdf = normal_01_cdf ( beta );
  xi_cdf = normal_01_cdf ( xi );

  cdf = xi_cdf / beta_cdf;

  return
end
