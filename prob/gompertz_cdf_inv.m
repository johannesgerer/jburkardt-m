function x = gompertz_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% GOMPERTZ_CDF_INV inverts the Gompertz CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Johnson, Kotz, and Balakrishnan,
%    Continuous Univariate Distributions, Volume 2, second edition,
%    Wiley, 1994, pages 25-26.
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    1 < A, 0 < B.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 )
    x = 0.0;
  elseif ( cdf < 1.0 )
    x = log ( 1.0 - log ( 1.0 - cdf ) * log ( a ) / b  ) / log ( a );
  else
    x = r8_huge ( );
  end

  return
end
