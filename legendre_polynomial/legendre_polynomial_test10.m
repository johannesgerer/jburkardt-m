function legendre_polynomial_test10 ( p )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST10 tests PN_PAIR_PRODUCT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2012
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST10\n' );
  fprintf ( 1, '  Compute a pair product table for Pn(n,x):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( -1 <= x <= +1 ) Pn(i,x) Pn(j,x) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Pn(n,x) polynomials are orthonormal,\n' );
  fprintf ( 1, '  so T should be the identity matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );

  table = pn_pair_product ( p );

  r8mat_print ( p + 1, p + 1, table, '  Pair product table:' );

  return
end