function [ x, seed ] = maxwell_sample ( a, seed )

%*****************************************************************************80
%
%% MAXWELL_SAMPLE samples the Maxwell PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    0 < A.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a2 = 3.0;
  [ x, seed ] = chi_square_sample ( a2, seed );

  x = a * sqrt ( x );

  return
end
