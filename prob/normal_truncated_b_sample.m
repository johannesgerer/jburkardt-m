function [ x, seed ] = normal_truncated_b_sample ( mu, s, b, seed )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_B_SAMPLE samples the upper truncated Normal PDF.
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
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real B, the upper truncation limit.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, real X, a sample of the PDF.
%
  beta = ( b - mu ) / s;

  beta_cdf = normal_01_cdf ( beta );

  [ u, seed ] = r8_uniform_01 ( seed );
  xi_cdf =  u * beta_cdf;
  xi = normal_01_cdf_inv ( xi_cdf );

  x = mu + s * xi;

  return
end