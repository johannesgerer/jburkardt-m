function variance = truncated_normal_ab_variance ( mu, sigma, a, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_AB_VARIANCE returns the variance of the truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real MU, SIGMA, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, B, the lower and upper truncation limits.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  alpha = ( a - mu ) / sigma;
  beta = ( b - mu ) / sigma;

  alpha_pdf = normal_01_pdf ( alpha );
  beta_pdf = normal_01_pdf ( beta );

  alpha_cdf = normal_01_cdf ( alpha );
  beta_cdf = normal_01_cdf ( beta );

  variance = sigma * sigma * ( 1.0 ...
    + ( alpha * alpha_pdf - beta * beta_pdf ) / ( beta_cdf - alpha_cdf ) ...
    - ( ( alpha_pdf - beta_pdf ) / ( beta_cdf - alpha_cdf ) ) ^ 2 );

  return
end
