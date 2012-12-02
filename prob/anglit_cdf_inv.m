function x = anglit_cdf_inv ( cdf )

%*****************************************************************************80
%
%% ANGLIT_CDF_INV inverts the Anglit CDF.
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
%    0.0 <= CDF <= 1.0.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ANGLIT_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'ANGLIT_CDF_INV - Fatal error!' );
  end

  x = 0.5 * ( acos ( 1.0 - 2.0 * cdf ) - pi / 2.0 );

  return
end
