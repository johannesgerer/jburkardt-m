function laguerre_polynomial_test08 ( p, e )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST08 tests L_POWER_PRODUCT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
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
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST08\n' );
  fprintf ( 1, '  Compute a power product table for L(n,x):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( 0 <= x < +oo ) x^e L(i,x) L(j,x) exp(-x) dx\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );
  fprintf ( 1, '  Exponent of X, E = %d\n', e );

  table = l_power_product ( p, e );

  r8mat_print ( p + 1, p + 1, table, '  Power product table:' );

  return
end
