function x = frechet_cdf_inv ( cdf, alpha )

%*****************************************************************************80
%
%% FRECHET_CDF_INV inverts the Frechet CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
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
%    Input, real ALPHA, the parameter.
%    It is required that 0.0 < ALPHA.
%
%    Output, real X, the corresponding argument of the CDF.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_CDF_INV - Fatal error%\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'FRECHET_CDF_INV - Fatal error!' );
  end

  if ( alpha <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_CDF_INV - Fatal error%\n' );
    fprintf ( 1, '  ALPHA <= 0.0.\n' );
    error ( 'FRECHET_CDF_INV - Fatal error!' );
  end

  if ( cdf == 0.0 )
    x = 0.0;
  else
    x =  ( - 1.0 / log ( cdf ) )^( 1.0 / alpha );
  end

  return
end
