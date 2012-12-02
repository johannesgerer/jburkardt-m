function cdf = frechet_cdf ( x, alpha )

%*****************************************************************************80
%
%% FRECHET_CDF evaluates the Frechet CDF.
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
%    Input, real ALPHA, the parameter.
%    It is required that 0.0 < ALPHA.
%
%    Input, real X, the argument of the CDF.
%
%    Output, real CDF, the value of the CDF.
%
  if ( alpha <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_CDF - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= 0.0.\n' );
    error ( 'FRECHET_CDF - Fatal error!' );
  end

  if ( x <= 0.0 )
    cdf = 0.0;
  else
    cdf = exp ( - 1.0 / x^alpha );
  end

  return
end
