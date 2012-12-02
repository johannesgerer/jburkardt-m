function legendre_polynomial_test05 ( p, b )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST05 tests P_EXPONENTIAL_PRODUCT.
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
%    Input, real B, the coefficient of X in the exponential factor.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST05\n' );
  fprintf ( 1, '  Compute an exponential product table for P(n,x):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( -1 <= x <= +1 ) exp(b*x) P(i,x) P(j,x) dx\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );
  fprintf ( 1, '  Exponential argument coefficient B = %g\n', b );

  table = p_exponential_product ( p, b );

  r8mat_print ( p + 1, p + 1, table, '  Exponential product table:' );

  return
end
