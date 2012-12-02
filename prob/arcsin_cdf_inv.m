function x = arcsin_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% ARCSIN_CDF_INV inverts the Arcsin CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0D+00 <= CDF <= 1.0.
%
%    Input, real A, the parameter of the CDF.
%    A must be positive.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ARCSIN_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'ARCSIN_CDF_INV - Fatal error!' );
  end

  x = a * sin ( pi * ( cdf - 0.5 ) );

  return
end
