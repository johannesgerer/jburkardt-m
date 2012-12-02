function result = sphere_monomial_int_nd ( n, r, e )

%*****************************************************************************80
%
%% SPHERE_MONOMIAL_INT_ND integrates a monomial on a sphere in ND.
%
%  Discussion:
%
%    The sphere may have nonunit radius, but it must be centered at 0.
%
%    The integration region is
%
%      sum ( x(i)**2 ) = R**2.
%
%    The monomial is F(X) = X(1)**E(1) * X(2)**E(2) * ... * X(N)**E(N).
%
%    This routine is useful for testing the accuracy of quadrature
%    rules on the sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 January 2008
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
%    Input, integer N, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Input, integer E(N), the exponents of X, Y and Z in the monomial.
%    Each exponent must be nonnegative.
%
%    Output, real RESULT, the integral.
%
  if ( any ( e(1:n) < 0 ) )
    result = -r8_huge ( result );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_MONOMIAL_INT_ND - Fatal error!\n' );
    fprintf ( 1, '  All exponents must be nonnegative.\n' );
    error ( 'SPHERE_MONOMIAL_INT_ND - Fatal error!' );
  end

  if ( all ( e(1:n) == 0 ) )

    result = 2.0 * sqrt ( pi^n ) / gamma ( 0.5 * n );

  elseif ( any ( mod ( e(1:n), 2 ) == 1 ) )

    result = 0.0;

  else

    result = 2.0;

    for i = 1 : n
      result = result * gamma ( 0.5 * ( e(i) + 1 ) );
    end

    result = result / gamma ( 0.5 * ( sum ( e(1:n) + 1 ) ) );

  end

  result = result * r^( sum ( e(1:n) ) + 2 );

  return
end
