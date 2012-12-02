function test_values_test123 ( )

%*****************************************************************************80
%
%% TEST123 demonstrates the use of R8_FACTORIAL_VALUES.
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
  fprintf ( 1, 'TEST123:\n' );
  fprintf ( 1, '  R8_FACTORIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the factorial function (using real arithmetic).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N       Factorial(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = r8_factorial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %24.16e\n', n, fn );

  end

  return
end
