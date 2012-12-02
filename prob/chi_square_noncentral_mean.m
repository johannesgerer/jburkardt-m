function mean = chi_square_noncentral_mean ( a, b )

%*****************************************************************************80
%
%% CHI_SQUARE_NONCENTRAL_MEAN returns the mean of the noncentral Chi squared PDF.
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
%    Output, real MEAN, the mean value.
%
  mean = a + b;

  return
end
