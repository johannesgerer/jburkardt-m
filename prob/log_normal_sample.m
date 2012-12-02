function [ x, seed ] = log_normal_sample ( a, b, seed )

%*****************************************************************************80
%
%% LOG_NORMAL_SAMPLE samples the Lognormal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = log_normal_cdf_inv ( cdf, a, b );

  return
end
