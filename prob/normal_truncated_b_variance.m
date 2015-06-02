function variance = normal_truncated_b_variance ( mu, s, b )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_B_VARIANCE: variance of the upper truncated Normal PDF.
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
%    Input, real B, the upper truncation limit.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  beta = ( b - mu ) / s;

  beta_pdf = normal_01_pdf ( beta );

  beta_cdf = normal_01_cdf ( beta );

  variance = s * s * ( 1.0 ...
    - ( beta * beta_pdf ) / beta_cdf ...
    - ( beta_pdf / beta_cdf ) ^ 2 );

  return
end