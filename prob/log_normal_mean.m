function mean = log_normal_mean ( a, b )

%*****************************************************************************80
%
%% LOG_NORMAL_MEAN returns the mean of the Lognormal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 1999
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = exp ( a + 0.5 * b * b );

  return
end
