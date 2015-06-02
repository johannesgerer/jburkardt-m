function quadrule_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests KRONROD_SET, LEGENDRE_SET and SUM_SUB_GK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 October 2009
%
%  Author:
%
%    John Burkardt
%
  norderg = 7;
  norderk = 2 * norderg + 1;

  a = - 1.0;
  b =   1.0;
  nsub = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  KRONROD_SET sets up Kronrod quadrature;\n' );
  fprintf ( 1, '  LEGENDRE_SET sets up Gauss-Legendre quadrature;\n' );
  fprintf ( 1, '  SUM_SUB_GK carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integration interval is [%f, %f]\n', a, b );
  fprintf ( 1, '  Number of subintervals is %d\n', nsub );
  fprintf ( 1, '  Integrand is X^2 / SQRT ( 1.1 - X^2 ).\n' );
  fprintf ( 1, '\n' );

  [ xtabg, weightg ] = legendre_set ( norderg );

  [ xtabk, weightk ] = kronrod_set ( norderk );

  [ resultg, resultk, error_est ] = sum_sub_gk ( @fx2sd1, a, b, nsub, ...
    norderg, weightg, norderk, xtabk, weightk );

  fprintf ( 1, '  %2d  %12f\n', norderg, resultg );
  fprintf ( 1, '  %2d  %12f\n', norderk, resultk );
  fprintf ( 1, '      %12f\n', error_est );

  return
end
