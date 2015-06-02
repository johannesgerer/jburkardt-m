function integral = hyperball01_monomial_integral ( m, e )

%*****************************************************************************80
%
%% HYPERBALL01_MONOMIAL_INTEGRAL: integrals in unit hyperball in M dimensions.
%
%  Discussion:
%
%    The integration region is 
%
%      sum ( 1 <= I <= M ) X(I)^2 <= 1.
%
%    The monomial is F(X) = product ( 1 <= I <= M ) X(I)^E(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 January 2014
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer E(M), the exponents.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  if ( any ( e(1:m) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERBALL01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'HYPERBALL01_MONOMIAL_INTEGRAL - Fatal error!' );
  end
%
%  Integrate over the surface.
%
  if ( any ( mod ( e(1:m), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : m
      integral = integral * gamma ( 0.5 * ( e(i) + 1 ) );
    end

    integral = integral / gamma ( 0.5 * ( sum ( e(1:m) + 1 ) ) );

  end
%
%  The surface integral is now adjusted to give the volume integral.
%
  r = 1.0;
  s = sum ( e(1:m) ) + m;

  integral = integral * r ^ s / s;

  return
end
