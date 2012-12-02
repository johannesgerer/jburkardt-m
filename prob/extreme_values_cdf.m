function cdf = extreme_values_cdf ( x, a, b )

%*****************************************************************************80
%
%% EXTREME_VALUES_CDF evaluates the Extreme Values CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
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
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  y = ( x - a ) / b;

  cdf = exp ( - exp ( - y ) );

  return
end
