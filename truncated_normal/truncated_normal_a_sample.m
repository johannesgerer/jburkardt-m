function [ x, seed ] = truncated_normal_a_sample ( mu, sigma, a, seed )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_SAMPLE samples the lower truncated Normal PDF.
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
%    Input, real MU, SIGMA, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, the lower truncation limit.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, real X, a sample of the PDF.
%
  alpha = ( a - mu ) / sigma;

  alpha_cdf = normal_01_cdf ( alpha );
  beta_cdf = 1.0D+00;

  [ u, seed ] = r8_uniform_01 ( seed );
  xi_cdf = alpha_cdf + u * ( beta_cdf - alpha_cdf );
  xi = normal_01_cdf_inv ( xi_cdf );

  x = mu + sigma * xi;

  return
end
