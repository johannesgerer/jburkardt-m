function [ x, seed ] = geometric_sample ( a, seed )

%*****************************************************************************80
%
%% GEOMETRIC_SAMPLE samples the Geometric PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = geometric_cdf_inv ( cdf, a );

  return
end
