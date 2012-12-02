function variance = power_variance ( a, b )

%*****************************************************************************80
%
%% POWER_VARIANCE returns the variance of the Power PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A, 0.0 < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = b * b * a / ( ( a + 1.0 )^2 * ( a + 2.0 ) );

  return
end
