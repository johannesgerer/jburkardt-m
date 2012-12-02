function variance = exponential_variance ( a, b )

%*****************************************************************************80
%
%% EXPONENTIAL_VARIANCE returns the variance of the Exponential PDF.
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
%    0.0D+00 < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = b * b;

  return
end
