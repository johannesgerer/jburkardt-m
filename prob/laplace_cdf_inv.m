function x = laplace_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% LAPLACE_CDF_INV inverts the Laplace CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2004
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
    fprintf ( 1, 'LAPLACE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'LAPLACE_CDF_INV - Fatal error!' );
  end

  if ( cdf <= 0.5 )
    x = a + b * log ( 2.0 * cdf );
  else
    x = a - b * log ( 2.0 * ( 1.0 - cdf ) );
  end

  return
end
