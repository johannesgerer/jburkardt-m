function mean = burr_mean ( a, b, c, d )

%*****************************************************************************80
%
%% BURR_MEAN returns the mean of the Burr PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, D, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = a + b * gamma ( 1.0 - 1.0 / c ) * gamma ( d + 1.0 / c ) / gamma ( d );

  return
end
