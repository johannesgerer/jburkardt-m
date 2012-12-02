function [ x, seed ] = rayleigh_sample ( a, seed )

%*****************************************************************************80
%
%% RAYLEIGH_SAMPLE samples the Rayleigh PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = rayleigh_cdf_inv ( cdf, a );

  return
end
