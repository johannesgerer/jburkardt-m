function mean = folded_normal_mean ( a, b )

%*****************************************************************************80
%
%% FOLDED_NORMAL_MEAN returns the mean of the Folded Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A,
%    0.0 < B.
%
%    Output, real MEAN, the mean of the PDF.
%
  a2 = a / b;

  cdf = normal_01_cdf ( a2 );

  mean = b * sqrt ( 2.0 / pi ) * exp ( -0.5 * a2 * a2 ) - a * ( 1.0 - 2.0 * cdf );

  return
end
