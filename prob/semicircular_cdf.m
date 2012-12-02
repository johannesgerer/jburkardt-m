function cdf = semicircular_cdf ( x, a, b )

%*****************************************************************************80
%
%% SEMICIRCULAR_CDF evaluates the Semicircular CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameter of the PDF.
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= a - b )

    cdf = 0.0;

  elseif ( x <= a + b )

    y = ( x - a ) / b;

    cdf = 0.5 + ( y * sqrt ( 1.0 - y * y ) + asin ( y ) ) / pi;

  elseif ( a + b < x )

    cdf = 1.0;

  end

  return
end
