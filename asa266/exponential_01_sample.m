function [ x, seed ] = exponential_01_sample ( seed )

%*****************************************************************************80
%
%% EXPONENTIAL_01_SAMPLE samples the Exponential PDF with parameter 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = - log ( 1.0 - cdf );

  return
end
