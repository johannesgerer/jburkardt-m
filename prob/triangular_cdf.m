function cdf = triangular_cdf ( x, a, b )

%*****************************************************************************80
%
%% TRIANGULAR_CDF evaluates the Triangular CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
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
%    A < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= a )
    cdf = 0.0;
  elseif ( x <= 0.5 * ( a + b ) )
    cdf = 2.0 * ( x * x - 2.0 * a * x + a * a ) / ( b - a )^2;
  elseif ( x <= b )
    cdf = 0.5 + ( -2.0 * x * x + 4.0 * b * x + 0.5 * a * a ...
      - a * b - 1.5 * b * b ) / ( b - a )^2;
  else
    cdf = 1.0;
  end

  return
end
