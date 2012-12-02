function x = beta_binomial_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% BETA_BINOMIAL_CDF_INV inverts the Beta Binomial CDF.
%
%  Discussion:
%
%    A simple discrete approach is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, B, parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Input, integer C, a parameter of the PDF.
%    0 <= C.
%
%    Output, integer X, the smallest X whose cumulative density function
%    is greater than or equal to CDF.
%
  if ( cdf <= 0.0 )

    x = 0;

  else

    cum = 0.0;

    for y = 0 : c

      pdf = beta ( a + y, b + c - y ) / ( ( c + 1 ) ...
        * beta ( y + 1, c - y + 1 ) * beta ( a, b ) );

      cum = cum + pdf;

      if ( cdf <= cum )
        x = y;
        return
      end

    end

    x = c;

  end

  return
end
