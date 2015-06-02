function integral = disk01_monomial_integral ( e )

%*****************************************************************************80
%
%% DISK01_MONOMIAL_INTEGRAL returns monomial integrals in the unit disk.
%
%  Discussion:
%
%    The integration region is 
%
%      X^2 + Y^2 <= 1.
%
%    The monomial is F(X,Y) = X^E(1) * Y^E(2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer E(2), the exponents of X and Y in the 
%    monomial.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  r = 1.0;

  if ( any ( e(1:2) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DISK01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'DISK01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  if ( any ( mod ( e(1:2), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : 2
      arg = 0.5 * ( e(i) + 1 );
      integral = integral * gamma ( arg );
    end

    arg = 0.5 * ( sum ( e(1:2) + 1 ) );
    integral = integral / gamma ( arg );

  end
%
%  The surface integral is now adjusted to give the volume integral.
%
  s = sum ( e(1:2) ) + 2;

  integral = integral * r ^ s / s;

  return
end
