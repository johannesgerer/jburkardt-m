function variance = chi_square_noncentral_variance ( a, b )

%*****************************************************************************80
%
%% CHI_SQUARE_NONCENTRAL_VARIANCE returns the variance of the noncentral Chi squared PDF.
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
%    Input, real A, the parameter of the PDF.
%    1 <= A.
%
%    Input, real B, the noncentrality parameter of the PDF.
%    0.0 <= B.
%
%    Output, real VARIANCE, the variance value.
%
  variance = 2.0 * ( a + 2.0 * b );

  return
end
