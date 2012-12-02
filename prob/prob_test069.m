function prob_test069 ( )

%*****************************************************************************80
%
%% TEST069 tests FACTORIAL_LOG, GAMMA_LOG_INT;
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
  fprintf ( 1, 'TEST069\n' );
  fprintf ( 1, '  FACTORIAL_LOG evaluates the log of the factorial function;\n' );
  fprintf ( 1, '  GAMMA_LOG_INT evaluates the log for integer argument.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I, GAMMA_LOG_INT(I+1) FACTORIAL_LOG(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 20
    g = gamma_log_int ( i+1 );
    f = factorial_log ( i );
    fprintf ( 1, '  %6d  %14f  %14f\n', i, g, f );
  end

  return
end
