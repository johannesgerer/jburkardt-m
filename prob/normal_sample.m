function [ x, seed ] = normal_sample ( a, b, seed )

%*****************************************************************************80
%
%% NORMAL_SAMPLE samples the Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
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
  [ y, seed ] = normal_01_sample ( seed );

  x = a + b * y;

  return
end
