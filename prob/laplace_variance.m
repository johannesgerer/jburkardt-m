function variance = laplace_variance ( a, b )

%*****************************************************************************80
%
%% LAPLACE_VARIANCE returns the variance of the Laplace PDF.
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
  variance = 2.0 * b * b;

  return
end
