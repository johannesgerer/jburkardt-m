function variance = truncated_normal_a_variance ( mu, sigma, a )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_VARIANCE: variance of the lower truncated Normal PDF.
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
%    Input, real A, the lower truncation limit.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  alpha = ( a - mu ) / sigma;

  alpha_pdf = normal_01_pdf ( alpha );

  alpha_cdf = normal_01_cdf ( alpha );

  variance = sigma * sigma * ( 1.0 ...
    + ( alpha * alpha_pdf ) / ( 1.0 - alpha_cdf ) ...
    - ( alpha_pdf / ( 1.0 - alpha_cdf ) ) ^ 2 );

  return
end
