function mean = normal_truncated_b_mean ( mu, s, b )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_B_MEAN returns the mean of the upper truncated Normal PDF.
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
%    Input, real B, the upper truncation limit.
%
%    Output, real MEAN, the mean of the PDF.
%
  beta = ( b - mu ) / s;

  beta_cdf = normal_01_cdf ( beta );

  beta_pdf = normal_01_pdf ( beta );

  mean = mu - s * beta_pdf / beta_cdf;

  return
end