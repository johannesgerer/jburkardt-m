function [ x, seed ] = bernoulli_sample ( a, seed )

%*****************************************************************************80
%
%% BERNOULLI_SAMPLE samples the Bernoulli PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of success on one trial.
%    0.0D+00 <= A <= 1.0.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = bernoulli_cdf_inv ( cdf, a );

  return
end
