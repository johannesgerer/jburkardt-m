function r8_factorial_log_values_test ( )

%*****************************************************************************80
%
%% R8_FACTORIAL_LOG_VALUES_TEST demonstrates the use of R8_FACTORIAL_LOG_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_FACTORIAL_LOG_VALUES_TEST:\n' );
  fprintf ( 1, '  R8_FACTORIAL_LOG_VALUES stores values of\n' );
  fprintf ( 1, '  the logarithm of the factorial function\n' );
  fprintf ( 1, '  (using real arithmetic).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N       Log(Factorial(N))\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = r8_factorial_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %24.16f\n', n, fn );

  end

  return
end
