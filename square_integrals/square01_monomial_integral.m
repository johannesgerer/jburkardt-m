function integral = square01_monomial_integral ( e )

%*****************************************************************************80
%
%% SQUARE01_MONOMIAL_INTEGRAL: integrals over the unit square in 2D.
%
%  Discussion:
%
%    The integration region is 
%
%      0 <= X <= 1,
%      0 <= Y <= 1.
%
%    The monomial is F(X,Y) = X^E(1) * Y^E(2).
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
%    Input, integer E(2), the exponents.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  m = 2;

  if ( any ( e(1:m) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SQUARE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'SQUARE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  integral = 1.0;
  for i = 1 : m
    integral = integral / ( e(i) + 1 );
  end

  return
end
