function pdf = truncated_normal_a_pdf ( x, mu, sigma, a )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_PDF evaluates the lower truncated Normal PDF.
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
%    Input, real X, the argument of the PDF.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, the lower truncation limit.
%
%    Output, real PDF, the value of the PDF.
%
  alpha = ( a - mu ) / sigma;
  xi = ( x - mu ) / sigma;

  alpha_cdf = normal_01_cdf ( alpha );
  xi_pdf = normal_01_pdf ( xi );

  pdf = xi_pdf / ( 1.0 - alpha_cdf ) / sigma;

  return
end
