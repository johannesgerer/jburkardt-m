function [ x, seed ] = quasigeometric_sample ( a, b, seed )

%*****************************************************************************80
%
%% QUASIGEOMETRIC_SAMPLE samples the Quasigeometric PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of 0 successes.
%    0.0 <= A <= 1.0.
%
%    Input, real B, the depreciation constant.
%    0.0 <= B < 1.0.
%
%    Input, integer SEED, a seed for the random 
%    number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = quasigeometric_cdf_inv ( cdf, a, b );

  return
end
