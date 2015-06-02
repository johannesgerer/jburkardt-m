function variance = truncated_normal_b_variance ( mu, sigma, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_B_VARIANCE: variance of the upper truncated Normal PDF.
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
%    Input, real MU, SIGMA, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real B, the upper truncation limit.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  beta = ( b - mu ) / sigma;

  beta_pdf = normal_01_pdf ( beta );

  beta_cdf = normal_01_cdf ( beta );

  variance = sigma * sigma * ( 1.0 ...
    - ( beta * beta_pdf ) / beta_cdf ...
    - ( beta_pdf / beta_cdf ) ^ 2 );

  return
end
