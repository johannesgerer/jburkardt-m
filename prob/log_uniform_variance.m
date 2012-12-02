function variance = log_uniform_variance ( a, b )

%*****************************************************************************80
%
%% LOG_UNIFORM_VARIANCE returns the variance of the Log Uniform PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2006
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
%    Output, real VARIANCE, the variance of the PDF.
%
  mean = log_uniform_mean ( a, b );

  variance = ...
    ( ( 0.5 * b * b - 2.0 * mean * b + mean * mean * log ( b ) ) ...
    - ( 0.5 * a * a - 2.0 * mean * a + mean * mean * log ( a ) ) ) ...
    / ( log ( b ) - log ( a ) );

  return
end
