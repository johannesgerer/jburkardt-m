function mean = log_uniform_mean ( a, b )

%*****************************************************************************80
%
%% LOG_UNIFORM_MEAN returns the mean of the Log Uniform PDF.
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
%    1.0 < A < B.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = ( b - a ) / ( log ( b ) - log ( a ) );

  return
end
