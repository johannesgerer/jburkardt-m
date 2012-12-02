function x = weibull_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% WEIBULL_CDF_INV inverts the Weibull CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 < CDF < 1.0.
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real X, the corresponding argument of the CDF.
%
  x = a + b * ( -log ( 1.0 - cdf ) )^( 1.0 / c );

  return
end
