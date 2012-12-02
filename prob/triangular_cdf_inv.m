function x = triangular_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% TRIANGULAR_CDF_INV inverts the Triangular CDF.
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
%    0.0 <= CDF <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    A < B.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULAR_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    stop
  end

  if ( cdf <= 0.5 )
    x = a + 0.5 * ( b - a ) * sqrt ( 2.0 * cdf );
  else
    x = b - 0.5 * ( b - a ) * sqrt ( 2.0 * ( 1.0 - cdf ) );
  end

  return
end
