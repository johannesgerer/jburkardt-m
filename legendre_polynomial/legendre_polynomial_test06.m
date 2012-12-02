function legendre_polynomial_test06 ( p, e )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST06 tests P_POWER_PRODUCT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the maximum degree of the polynomial 
%    factors.
%
%    Input, integer E, the exponent of X.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST06\n' );
  fprintf ( 1, '  Compute a power product table for P(n,x):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( -1 <= x <= +1 ) x^e P(i,x) P(j,x) dx\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );
  fprintf ( 1, '  Exponent of X, E = %d\n', e );

  table = p_power_product ( p, e );

  r8mat_print ( p + 1, p + 1, table, '  Power product table:' );

  return
end
