function x = quasigeometric_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% QUASIGEOMETRIC_CDF_INV inverts the Quasigeometric CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0
%
%    Input, real A, the probability of 0 successes.
%    0.0 <= A <= 1.0.
%
%    Input, real B, the depreciation constant.
%    0.0 <= B < 1.0.
%
%    Output, integer X, the corresponding value of X.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUASIGEOMETRIC_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'QUASIGEOMETRIC_CDF_INV - Fatal error!' );
  end

  if ( cdf < a )
    x = 0;
  elseif ( b == 0.0 )
    x = 1;
  else
    x = 1 + floor ( ( log ( 1.0 - cdf ) - log ( 1.0 - a ) ) / log ( b ) );
  end

  return
end
