function variance = gamma_variance ( a, b, c )

%*****************************************************************************80
%
%% GAMMA_VARIANCE returns the variance of the Gamma PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
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
  variance = b * b * c;

  return
end
