function cdf = normal_ms_cdf ( x, mu, sigma )

%*****************************************************************************80
%
%% NORMAL_MS_CDF evaluates the Normal CDF.
%
%  Discussion:
%
%    The Normal CDF is related to the Error Function ERF(X) by:
%
%      ERF ( X ) = 2 * NORMAL_CDF ( SQRT ( 2 ) * X ) - 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, real MU, SIGMA, the parameters of the PDF.
%    0.0 < SIGMA.
%
%    Output, real CDF, the value of the CDF.
%
  y = ( x - mu ) / sigma;

  cdf = normal_01_cdf ( y );

  return
end
