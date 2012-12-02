function variance = beta_binomial_variance ( a, b, c )

%*****************************************************************************80
%
%% BETA_BINOMIAL_VARIANCE returns the variance of the Beta Binomial PDF.
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
%    Input, real A, B, parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Input, integer C, a parameter of the PDF.
%    0 <= C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = c * a * b * ( a + b + c ) / ( ( a + b )^2 * ( a + b + 1.0 ) );

  return
end
