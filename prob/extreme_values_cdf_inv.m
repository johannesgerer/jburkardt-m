function x = extreme_values_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% EXTREME_VALUES_CDF_INV inverts the Extreme Values CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
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
%    0.0 < B.
%
%    Output, real X, the corresponding argument of the CDF.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EXTREME_VALUES_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'EXTREME_VALUES_CDF_INV - Fatal error!' );
  end

  x = a - b * log ( - log ( cdf ) );

  return
end
