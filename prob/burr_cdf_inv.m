function x = burr_cdf_inv ( cdf, a, b, c, d )

%*****************************************************************************80
%
%% BURR_CDF_INV inverts the Burr CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
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
%    Input, real A, B, C, D, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BURR_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'BURR_CDF_INV - Fatal error!' );
  end

  x = a + b / ( ( 1.0 / cdf )^( 1.0 / d ) - 1.0 )^( 1.0 / c );

  return
end
