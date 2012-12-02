function x = log_series_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% LOG_SERIES_CDF_INV inverts the Logarithmic Series CDF.
%
%  Discussion:
%
%    Simple summation is used.  The only protection against an
%    infinite loop caused by roundoff is that X cannot be larger
%    than 1000.
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
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A < 1.0.
%
%    Output, real X, the argument of the CDF for which
%    CDF(X-1) <= CDF <= CDF(X).
%
  xmax = 1000;

  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LOG_SERIES_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'LOG_SERIES_CDF_INV - Fatal error!' );
  end

  cdf2 = 0.0;
  x = 1;

  while ( cdf2 < cdf & x < xmax )

    if ( x == 1 )
      pdf = - a / log ( 1.0 - a );
    else
      pdf = ( x - 1 ) * a * pdf / x;
    end

    cdf2 = cdf2 + pdf;

    x = x + 1;

  end

  return
end
