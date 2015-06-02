function integral = hypercube01_monomial_integral ( m, e )

%*****************************************************************************80
%
%% HYPERCUBE01_MONOMIAL_INTEGRAL: integrals over the unit hypercube in M dimensions.
%
%  Discussion:
%
%    The integration region is 
%
%      0 <= X(1:M) <= 1,
%
%    The monomial is F(X) = product ( 1 <= I <= M ) X(I)^E(I).
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer E(M), the exponents.  Each exponent must be nonnegative.
%
%    Output, real INTEGRAL, the integral.
%
  if ( any ( e(1:m) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERCUBE01_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'HYPERCUBE01_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  integral = 1.0;
  for i = 1 : m
    integral = integral / ( e(i) + 1 );
  end

  return
end
