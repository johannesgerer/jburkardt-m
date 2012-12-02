function x = half_normal_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% HALF_NORMAL_CDF_INV inverts the Half Normal CDF.
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
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALF_NORMAL_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'HALF_NORMAL_CDF_INV - Fatal error!' );
  end

  cdf2 = 0.5 * ( cdf + 1.0 );

  x = normal_cdf_inv ( cdf2, a, b );

  return
end
