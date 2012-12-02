function cdf = bradford_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% BRADFORD_CDF evaluates the Bradford CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, C, the parameters of the PDF.
%    A < B,
%    0.0 < C.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= a )
    cdf = 0.0;
  elseif ( x <= b )
    cdf = log ( 1.0 + c * ( x - a ) / ( b - a ) ) / log ( c + 1.0 );
  elseif ( b < x )
    cdf = 1.0;
  end

  return
end
