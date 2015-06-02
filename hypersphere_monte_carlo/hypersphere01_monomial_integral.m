function integral = hypersphere01_monomial_integral ( m, e )

%*****************************************************************************80
%
%% HYPERSPHERE01_MONOMIAL_INTEGRAL: monomial integrals on the unit hypersphere.
%
%  Discussion:
%
%    The integration region is 
%
%      sum ( 1 <= I <= M ) X(I)^2 = 1.
%
%    The monomial is F(X) = product ( 1 <= I <= M ) X(I)^E(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer E(M), the exponents of X(1) through X(M). 
%    Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  if ( any ( e(1:m) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERSPHERE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'HYPERSPHERE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  if ( any ( mod ( e(1:m), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : m
      arg = 0.5 * ( e(i) + 1 );
      integral = integral * gamma ( arg );
    end

    arg = 0.5 * sum ( e(1:m) + 1 );
    integral = integral / gamma ( arg );

  end

  return
end
