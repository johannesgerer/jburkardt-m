function cdf = log_series_cdf ( x, a )

%*****************************************************************************80
%
%% LOG_SERIES_CDF evaluates the Logarithmic Series CDF.
%
%  Discussion:
%
%    Simple summation is used, with a recursion to generate successive
%    values of the PDF.
%
%    Thanks to Oscar van Vlijmen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 December 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the PDF.
%    0 < X
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A < 1.0.
%
%    Output, real CDF, the value of the CDF.
%
  cdf = 0.0;

  for x2 = 1 : x

    if ( x2 == 1 )
      pdf = - a / log ( 1.0 - a );
    else
      pdf = ( x2 - 1 ) * a * pdf / x2;
    end

    cdf = cdf + pdf;

  end

  return
end
