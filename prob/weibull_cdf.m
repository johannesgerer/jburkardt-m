function cdf = weibull_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% WEIBULL_CDF evaluates the Weibull CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%    A <= X.
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < a )
    cdf = 0.0;
  else
    y = ( x - a ) / b;
    cdf = 1.0 - 1.0 / exp ( y^c );
  end

  return
end
