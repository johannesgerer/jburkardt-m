function x = negative_binomial_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% NEGATIVE_BINOMIAL_CDF_INV inverts the Negative Binomial CDF.
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
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, integer A, real B, parameters of the PDF.
%    0 <= A,
%    0 < B <= 1.
%
%    Output, integer X, the smallest X whose cumulative density function
%    is greater than or equal to CDF.
%
  x_max = 1000;

  if ( cdf <= 0.0 )

    x = a;

  else

    cum = 0.0;

    x = a;

    while ( 1 )

      pdf = negative_binomial_pdf ( x, a, b );

      cum = cum + pdf;

      if ( cdf <= cum | x_max <= x )
        break
      end

      x = x + 1;

    end

  end

  return
end
