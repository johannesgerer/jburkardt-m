function cdf = normal_truncated_a_cdf ( x, mu, s, a )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_A_CDF evaluates the lower truncated Normal CDF.
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
%    Input, real A, the lower truncation limit.
%
%    Output, real CDF, the value of the CDF.
%
  alpha = ( a - mu ) / s;
  xi = ( x - mu ) / s;

  alpha_cdf = normal_01_cdf ( alpha );
  xi_cdf = normal_01_cdf ( xi );

  cdf = ( xi_cdf - alpha_cdf ) / ( 1.0 - alpha_cdf );

  return
end
