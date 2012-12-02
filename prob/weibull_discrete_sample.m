function [ x, seed ] = weibull_discrete_sample ( a, b, seed )

%*****************************************************************************80
%
%% WEIBULL_DISCRETE_SAMPLE samples the discrete Weibull PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A <= 1.0,
%    0.0 < B.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = weibull_discrete_cdf_inv ( cdf, a, b );

  return
end
