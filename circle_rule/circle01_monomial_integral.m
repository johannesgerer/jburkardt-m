function integral = circle01_monomial_integral ( e )

%*****************************************************************************80
%
%% CIRCLE01_MONOMIAL_INTEGRAL: integrals on circumference of unit circle in 2D.
%
%  Discussion:
%
%    The integration region is 
%
%      X^2 + Y^2 = 1.
%
%    The monomial is F(X,Y) = X^E(1) * Y^E(2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 January 2014
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
%    Input, integer E(2), the exponents of X and Y in the 
%    monomial.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  if ( any ( e(1:2) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'CIRCLE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  if ( any ( mod ( e(1:2), 2 ) == 1 ) )

    integral = 0.0;

  else

    integral = 2.0;

    for i = 1 : 2
      integral = integral * gamma ( 0.5 * ( e(i) + 1 ) );
    end

    integral = integral / gamma ( 0.5 * sum ( e(1:2) + 1 ) );

  end

  return
end
