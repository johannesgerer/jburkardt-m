function x = gumbel_cdf_inv ( cdf )

%*****************************************************************************80
%
%% GUMBEL_CDF_INV inverts the Gumbel CDF.
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
%    Output, real X, the corresponding argument of the CDF.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GUMBEL_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'GUMBEL_CDF_INV - Fatal error!' );
  end

  x =  - log ( - log ( cdf ) );

  return
end
