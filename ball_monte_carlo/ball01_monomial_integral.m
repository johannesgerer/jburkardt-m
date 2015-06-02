function integral = ball01_monomial_integral ( e )

%*****************************************************************************80
%
%% BALL01_MONOMIAL_INTEGRAL returns monomial integrals in the unit ball.
%
%  Discussion:
%
%    The integration region is 
%
%      X^2 + Y^2 + Z^2 <= 1.
%
%    The monomial is F(X,Y,Z) = X^E(1) * Y^E(2) * Z^E(3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gerald Folland,
%    How to Integrate a Polynomial Over a Sphere,
%    American Mathematical Monthly,
%    Volume 108, Number 5, May 2001, pages 446-448.
%
%  Parameters:
%
%    Input, integer E(3), the exponents of X, Y and Z in the 
%    monomial.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  if ( any ( e(1:3) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BALL01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'BALL01_MONOMIAL_INTEGRAL - Fatal error!' );
  end
%
%  Integrate over the surface.
%
  if ( all ( e(1:3) == 0 ) )

    integral = 2.0 * sqrt ( pi ^ 3 ) / gamma ( 1.5 );

  elseif ( any ( mod ( e(1:3), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : 3
      integral = integral * gamma ( 0.5 * ( e(i) + 1 ) );
    end

    integral = integral / gamma ( 0.5 * ( sum ( e(1:3) + 1 ) ) );

  end
%
%  The surface integral is now adjusted to give the volume integral.
%
  r = 1.0;
  s = sum ( e(1:3) ) + 3;

  integral = integral * r ^ s / s;

  return
end
