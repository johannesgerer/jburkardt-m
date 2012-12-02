function variance = semicircular_variance ( a, b )

%*****************************************************************************80
%
%% SEMICIRCULAR_VARIANCE returns the variance of the Semicircular PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
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
  variance = b * b / 4.0;

  return
end
