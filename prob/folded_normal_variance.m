function variance = folded_normal_variance ( a, b )

%*****************************************************************************80
%
%% FOLDED_NORMAL_VARIANCE returns the variance of the Folded Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A,
%    0.0 < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  mean = folded_normal_mean ( a, b );

  variance = a * a + b * b - mean * mean;

  return
end
