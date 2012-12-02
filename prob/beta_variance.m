function variance = beta_variance ( a, b )

%*****************************************************************************80
%
%% BETA_VARIANCE returns the variance of the Beta PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( a * b ) / ( ( a + b )^2 * ( 1.0 + a + b ) );

  return
end
