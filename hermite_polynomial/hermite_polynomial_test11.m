function hermite_polynomial_test11 ( p, e )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST11 tests HEN_POWER_PRODUCT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the maximum degree of the polynomial factors.
%
%    Input, integer E, the exponent of X in the integrand.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST11\n' );
  fprintf ( 1, '  Compute a normalized probabilist''s Hermite polynomial power product table.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( -oo < X < +oo ) X^E Hen(I,X) Hen(J,X) exp(-0.5*X*X) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where Hen(I,X) = normalized probabilist''s Hermite polynomial of degree I.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );
  fprintf ( 1, '  Exponent of X = %d\n', e );

  table = hen_power_product ( p, e );

  r8mat_print ( p + 1, p + 1, table, '  Power weighted table:' );

  return
end
