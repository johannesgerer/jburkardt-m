function cdf = cosine_cdf ( x, a, b )

%*****************************************************************************80
%
%% COSINE_CDF evaluates the Cosine CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
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
  if ( x <= a - pi * b )

    cdf = 0.0;

  elseif ( x <= a + pi * b )

    y = ( x - a ) / b;

    cdf = 0.5 + ( y + sin ( y ) ) / ( 2.0 * pi );

  elseif ( a + pi * b < x )

    cdf = 1.0;

  end

  return
end
