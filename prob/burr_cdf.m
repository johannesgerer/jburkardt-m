function cdf = burr_cdf ( x, a, b, c, d )

%*****************************************************************************80
%
%% BURR_CDF evaluates the Burr CDF.
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
%    Input, real A, B, C, D, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= a )

    cdf = 0.0;

  else

    cdf = 1.0 / ( 1.0 + ( b / ( x - a ) )^c  )^d;

  end

  return
end
