function x = normal_ms_cdf_inv ( cdf, mu, sigma )

%*****************************************************************************80
%
%% NORMAL_MS_CDF_INV inverts the Normal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
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
%    Input, real MU, SIGMA, the parameters of the PDF.
%    0.0 < SIGMA.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NORMAL_MS_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'NORMAL_MS_CDF_INV - Fatal error!' );
  end

  x2 = normal_01_cdf_inv ( cdf );

  x = mu + sigma * x2;

  return
end
