function cdf = cauchy_cdf ( x, a, b )

%*****************************************************************************80
%
%% CAUCHY_CDF evaluates the Cauchy CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0D+00 < B.
%
%    Output, real CDF, the value of the CDF.
%
  y = ( x - a ) / b;

  cdf = 0.5 + atan ( y ) / pi;

  return
end
