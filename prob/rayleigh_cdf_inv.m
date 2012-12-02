function x = rayleigh_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% RAYLEIGH_CDF_INV inverts the Rayleigh CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
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
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAYLEIGH_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'RAYLEIGH_CDF_INV - Fatal error!' );
  end

  x = sqrt ( -2.0 * a * a * log ( 1.0 - cdf ) );

  return
end
