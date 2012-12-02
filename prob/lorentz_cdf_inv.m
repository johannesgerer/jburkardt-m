function x = lorentz_cdf_inv ( cdf )

%*****************************************************************************80
%
%% LORENTZ_CDF_INV inverts the Lorentz CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 1999
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
    fprintf ( 1, 'LORENTZ_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'LORENTZ_CDF_INV - Fatal error!' );
  end

  x = tan ( pi * ( cdf - 0.5 ) );

  return
end
