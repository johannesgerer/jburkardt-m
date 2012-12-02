function integral = sphere01_monomial_integral ( e )

%*****************************************************************************80
%
%% SPHERE01_MONOMIAL_INTEGRAL returns monomial integrals on the unit sphere.
%
%  Discussion:
%
%    The integration region is 
%
%      X^2 + Y^2 + Z^2 = 1.
%
%    The monomial is F(X,Y,Z) = X^E(1) * Y^E(2) * Z^E(3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Academic Press, 1984, page 263.
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
    fprintf ( 1, 'SPHERE01_MONOMIAL_INTEGRAL - Fatal error%\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'SPHERE01_MONOMIAL_INTEGRAL - Fatal error%' );
  end

  if ( all ( e(1:3) == 0 ) )

    integral = 2.0 * sqrt ( pi^3 ) / gamma ( 1.5 );

  elseif ( any ( mod ( e(1:3), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : 3
      integral = integral * gamma ( 0.5 * ( e(i) + 1 ) );
    end

    integral = integral / gamma ( 0.5 * sum ( e(1:3) + 1 ) );

  end

  return
end
