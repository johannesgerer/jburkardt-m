function [ x, seed ] = chi_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% CHI_SAMPLE samples the Chi PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ x, seed ] = chi_square_sample ( c, seed );

  x = a + b * sqrt ( x );

  return
end
