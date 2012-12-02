function cdf = gompertz_cdf ( x, a, b )

%*****************************************************************************80
%
%% GOMPERTZ_CDF evaluates the Gompertz CDF.
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
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    1 < A, 0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )
    cdf = 0.0;
  else
    cdf = 1.0 - exp ( - b * ( a^x - 1.0 ) / log ( a ) );
  end

  return
end
