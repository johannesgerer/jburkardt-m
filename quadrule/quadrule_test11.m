function quadrule_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests KRONROD_SET, LEGENDRE_SET and SUMMER_GK.
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
  norderg = 10;
  norderk = 2 * norderg + 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  KRONROD_SET sets up Kronrod quadrature;\n' );
  fprintf ( 1, '  LEGENDRE_SET sets up Gauss-Legendre quadrature;\n' );
  fprintf ( 1, '  SUMMER_GK carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integration interval is [-1, 1].\n' );
  fprintf ( 1, '  Integrand is X**2 / SQRT ( 1.1 - X**2 ).\n' );
  fprintf ( 1, '\n' );

  [ xtabg, weightg ] = legendre_set ( norderg );

  [ xtabk, weightk ] = kronrod_set ( norderk );

  [ resultg, resultk ] = summer_gk ( @fx2sd1, norderg, weightg, ...
    norderk, xtabk, weightk );

  fprintf ( 1, '  %2d  %16f\n', norderg, resultg );
  fprintf ( 1, '  %2d  %16f\n', norderk, resultk );
  fprintf ( 1, '       %16f\n',  resultg - resultk );

  return
end
