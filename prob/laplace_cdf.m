function cdf = laplace_cdf ( x, a, b )

%*****************************************************************************80
%
%% LAPLACE_CDF evaluates the Laplace CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2004
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
%    Output, real CDF, the value of the PDF.
%
  y = ( x - a ) / b;

  if ( x <= a )
    cdf = 0.5 * exp ( y );
  else
    cdf = 1.0 - 0.5 * exp ( - y );
  end

  return
end
