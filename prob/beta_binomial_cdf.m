function cdf = beta_binomial_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% BETA_BINOMIAL_CDF evaluates the Beta Binomial CDF.
%
%  Discussion:
%
%    A simple summing approach is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the CDF.
%
%    Input, real A, B, parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Input, integer C, a parameter of the PDF.
%    0 <= C.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0 )

    cdf = 0.0;

  elseif ( x < c )

    cdf = 0.0;
    for y = 0 : x
      pdf = beta ( a + y, b + c - y ) / ( ( c + 1 ) ...
        * beta ( y + 1,  c - y + 1 ) * beta ( a, b ) );
      cdf = cdf + pdf;
    end

  elseif ( c <= x )

    cdf = 1.0;

  end

  return
end
