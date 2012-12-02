function x = log_normal_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% LOG_NORMAL_CDF_INV inverts the Lognormal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 1999
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
%    Input, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LOG_NORMAL_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'LOG_NORMAL_CDF_INV - Fatal error!' );
  end

  logx = normal_cdf_inv ( cdf, a, b );

  x = exp ( logx );

  return
end
