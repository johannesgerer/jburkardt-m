function mean = normal_truncated_a_mean ( mu, s, a )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_A_MEAN returns the mean of the lower truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real MU, S, the mean and standard deviatione of the
%    parent Normal distribution.
%
%    Input, real A, the lower truncation limit.
%
%    Output, real MEAN, the mean of the PDF.
%
  alpha = ( a - mu ) / s;

  alpha_cdf = normal_01_cdf ( alpha );

  alpha_pdf = normal_01_pdf ( alpha );

  mean = mu + s * alpha_pdf / ( 1.0 - alpha_cdf );

  return
end