function x = pareto_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% PARETO_CDF_INV inverts the Pareto CDF.
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
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 || 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARETO_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'PARETO_CDF_INV - Fatal error!' );
  end

  x = a / ( 1.0 - cdf )^( 1.0 / b );

  return
end
