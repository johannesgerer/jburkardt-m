function pdf = normal_truncated_b_pdf ( x, mu, s, b )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_B_PDF evaluates the upper truncated Normal PDF.
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
%    Input, real B, the upper truncation limit.
%
%    Output, real PDF, the value of the PDF.
%
  beta = ( b - mu ) / s;
  xi = ( x - mu ) / s;

  beta_cdf = normal_01_cdf ( beta );
  xi_pdf = normal_01_pdf ( xi );

  pdf = xi_pdf / beta_cdf / s;

  return
end