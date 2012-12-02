function cdf = exponential_cdf ( x, a, b )

%*****************************************************************************80
%
%% EXPONENTIAL_CDF evaluates the Exponential CDF.
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
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameter of the PDF.
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= a )
    cdf = 0.0;
  else
    cdf = 1.0 - exp ( ( a - x ) / b );
  end

  return
end
