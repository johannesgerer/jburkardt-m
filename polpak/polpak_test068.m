function polpak_test068 ( )

%*****************************************************************************80
%
%% TEST068 tests R8_FACTORIAL, R8_FACTORIAL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST068:\n' );
  fprintf ( 1, '  R8_FACTORIAL evaluates the factorial function.\n' );
  fprintf ( 1, '  R8_FACTORIAL_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N       Exact F       R8_FACTORIAL(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = r8_factorial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fn2 = r8_factorial ( n );

    fprintf ( 1, '  %4d  %12e  %12e\n', n, fn, fn2 );

  end

  return
end
