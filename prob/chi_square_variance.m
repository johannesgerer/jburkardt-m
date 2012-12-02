function variance = chi_square_variance ( a )

%*****************************************************************************80
%
%% CHI_SQUARE_VARIANCE returns the variance of the central Chi squared PDF.
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
%    Input, real A, the parameter of the distribution.
%    1 <= A.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = 2.0 * a;

  return
end
