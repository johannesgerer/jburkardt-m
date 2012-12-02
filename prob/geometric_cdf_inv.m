function x = geometric_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% GEOMETRIC_CDF_INV inverts the Geometric CDF.
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
%    0.0 <= CDF <= 1.0
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Output, integer X, the corresponding value of X.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEOMETRIC_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'GEOMETRIC_CDF_INV - Fatal error!' );
  end

  if ( a == 1.0 )
    x = 1;
  elseif ( a == 0.0 )
    x = r8_huge ( );
  else
    x = 1 + floor ( log ( 1.0 - cdf ) / log ( 1.0 - a ) );
  end

  return
end
