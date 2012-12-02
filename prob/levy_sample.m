function [ x, seed ] = levy_sample ( a, b, seed )

%*****************************************************************************80
%
%% LEVY_SAMPLE samples the Levy PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2007
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
%    Output, integer SEED, a seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = levy_cdf_inv ( cdf, a, b );

  return
end
