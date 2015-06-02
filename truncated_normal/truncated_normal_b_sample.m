function [ x, seed ] = truncated_normal_b_sample ( mu, sigma, b, seed )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_B_SAMPLE samples the upper truncated Normal PDF.
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
%    Input, real B, the upper truncation limit.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, real X, a sample of the PDF.
%
  beta = ( b - mu ) / sigma;

  beta_cdf = normal_01_cdf ( beta );

  [ u, seed ] = r8_uniform_01 ( seed );
  xi_cdf =  u * beta_cdf;
  xi = normal_01_cdf_inv ( xi_cdf );

  x = mu + sigma * xi;

  return
end
