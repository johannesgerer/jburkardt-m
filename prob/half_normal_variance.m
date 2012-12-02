function variance = half_normal_variance ( a, b, variance )

%*****************************************************************************80
%
%% HALF_NORMAL_VARIANCE returns the variance of the Half Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
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
  variance = b * b * ( 1.0 - 2.0 / pi );

  return
end
