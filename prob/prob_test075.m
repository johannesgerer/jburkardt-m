function prob_test075 ( )

%*****************************************************************************80
%
%% TEST075 tests GAMMA, GAMMALN, GAMMA_LOG_INT, I4_FACTORIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST075\n' );
  fprintf ( 1, '  GAMMA evaluates the Gamma function;\n' );
  fprintf ( 1, '  GAMMALN evaluates the log of the Gamma function;\n' );
  fprintf ( 1, '  GAMMA_LOG_INT evaluates the log for integer argument;\n' );
  fprintf ( 1, '  I4_FACTORIAL evaluates the factorial function.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, GAMMA(X), Exp(GAMMALN(X)), Exp(GAMMA_LOG_INT(X)) ' );
  fprintf ( 1, 'I4_FACTORIAL(X+1)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    x = i;
    g1 = gamma ( x );
    g2 = exp ( gammaln ( x ) );
    g3 = exp ( gamma_log_int ( i ) );
    g4 = i4_factorial ( i - 1 );
    fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', x, g1, g2, g3, g4 );
  end

  return
end
