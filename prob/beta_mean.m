function mean = beta_mean ( a, b )

%*****************************************************************************80
%
%% BETA_MEAN returns the mean of the Beta PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = a / ( a + b );

  return
end
