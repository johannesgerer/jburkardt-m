function mean = power_mean ( a, b )

%*****************************************************************************80
%
%% POWER_MEAN returns the mean of the Power PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = a * b / ( a + 1.0 );

  return
end
