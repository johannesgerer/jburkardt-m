function integral = cube01_monomial_integral ( e )

%*****************************************************************************80
%
%% CUBE01_MONOMIAL_INTEGRAL: integrals over the unit cube in 3D.
%
%  Discussion:
%
%    The integration region is 
%
%      0 <= X <= 1,
%      0 <= Y <= 1,
%      0 <= Z <= 1.
%
%    The monomial is F(X,Y,Z) = X^E(1) * Y^E(2) * Z^E(3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 January 2014
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
%    Input, integer E(3), the exponents.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  m = 3;

  if ( any ( e(1:m) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CUBE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'CUBE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  integral = 1.0;
  for i = 1 : m
    integral = integral / ( e(i) + 1 );
  end

  return
end
