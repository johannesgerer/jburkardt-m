function [ x, seed ] = pearson_05_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% PEARSON_05_SAMPLE samples the Pearson 5 PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < A, 0.0 < B.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a2 = 0.0;
  b2 = b;
  c2 = 1.0 / a;

  [ x2, seed ] = gamma_sample ( a2, b2, c2, seed );

  x = c + 1.0 / x2;

  return
end
