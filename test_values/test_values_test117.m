function test_values_test117 ( )

%*****************************************************************************80
%
%% TEST117 demonstrates the use of PI_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST117:\n' );
  fprintf ( 1, '  PI_VALUES returns values of\n' );
  fprintf ( 1, '  the PI function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         PI(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = pi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8d  %10d\n', n, fn )

  end

  return
end
