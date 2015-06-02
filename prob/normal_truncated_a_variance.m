function variance = normal_truncated_a_variance ( mu, s, a )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_A_VARIANCE: variance of the lower truncated Normal PDF.
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
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, the lower truncation limit.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  alpha = ( a - mu ) / s;
% beta = Inf;

  alpha_pdf = normal_01_pdf ( alpha );

  alpha_cdf = normal_01_cdf ( alpha );

  variance = s * s * ( 1.0 ...
    + ( alpha * alpha_pdf ) / ( 1.0 - alpha_cdf ) ...
    - ( alpha_pdf / ( 1.0 - alpha_cdf ) ) ^ 2 );

  return
end