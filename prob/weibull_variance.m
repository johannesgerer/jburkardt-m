function variance = weibull_variance ( a, b, c )

%*****************************************************************************80
%
%% WEIBULL_VARIANCE returns the variance of the Weibull PDF.
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
%    Output, real VARIANCE, the variance of the PDF.
%
  g1 = gamma ( ( c + 2.0 ) / c );
  g2 = gamma ( ( c + 1.0 ) / c );

  variance = b * b * ( g1 - g2 * g2 );

  return
end
