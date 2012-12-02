function mean = weibull_mean ( a, b, c )

%*****************************************************************************80
%
%% WEIBULL_MEAN returns the mean of the Weibull PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = b * gamma ( ( c + 1.0 ) / c ) + a;

  return
end
