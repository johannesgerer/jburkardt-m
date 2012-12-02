function laguerre_polynomial_test07 ( p, b )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST07 tests L_EXPONENTIAL_PRODUCT.
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
%    Input, real B, the coefficient of X in the exponential factor.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST07\n' );
  fprintf ( 1, '  Compute an exponential product table for L(n,x):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( 0 <= x < +oo ) exp(b*x) Ln(i,x) Ln(j,x) exp(-x) dx\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );
  fprintf ( 1, '  Exponential argument coefficient B = %g\n', b );

  table = l_exponential_product ( p, b );

  r8mat_print ( p + 1, p + 1, table, '  Exponential product table:' );

  return
end
