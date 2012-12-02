function x = weibull_discrete_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% WEIBULL_DISCRETE_CDF_INV inverts the Discrete Weibull CDF.
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
%    0.0 <= CDF <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A <= 1.0,
%    0.0 < B.
%
%    Output, integer X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WEIBULL_DISCRETE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'WEIBULL_DISCRETE_CDF_INV - Fatal error!' );
  end

  x = 1 + floor ( ( log ( 1.0 - cdf ) / log ( 1.0 - a ) )^( 1.0 / b ) - 1.0 );

  return
end
