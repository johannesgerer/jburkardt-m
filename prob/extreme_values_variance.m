function variance = extreme_values_variance ( a, b )

%*****************************************************************************80
%
%% EXTREME_VALUES_VARIANCE returns the variance of the Extreme Values PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = pi * pi * b * b / 6.0;

  return
end
