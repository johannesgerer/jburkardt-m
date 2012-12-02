function variance = logistic_variance ( a, b )

%*****************************************************************************80
%
%% LOGISTIC_VARIANCE returns the variance of the Logistic PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2004
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
  variance = ( pi * b )^2 / 3.0;

  return
end
