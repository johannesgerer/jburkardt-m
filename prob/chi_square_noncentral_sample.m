function [ x, seed ] = chi_square_noncentral_sample ( a, b, seed )

%*****************************************************************************80
%
%% CHI_SQUARE_NONCENTRAL_SAMPLE samples the noncentral Chi squared PDF.
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
%    Input, integer A, the parameter of the PDF.
%    1.0 <= A.
%
%    Input, real B, the noncentrality parameter of the PDF.
%    0.0 <= B.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a1 = a - 1.0;

  [ x1, seed ] = chi_square_sample ( a1, seed );

  a2 = sqrt ( b );
  b2 = 1.0;
  [ x2, seed ] = normal_sample ( a2, b2, seed );

  x = x1 + x2 * x2;

  return
end
