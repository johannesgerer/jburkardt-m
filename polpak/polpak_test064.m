function polpak_test064 ( )

%*****************************************************************************80
%
%% TEST064 tests OMEGA, OMEGA_VALUES.
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
  fprintf ( 1, 'TEST064\n' );
  fprintf ( 1, '  OMEGA counts the distinct prime divisors of an integer N.\n' );
  fprintf ( 1, '  OMEGA_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n'  );
  fprintf ( 1, '          N   Exact   OMEGA(N)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = omega_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = omega ( n );

    fprintf ( 1, '  %10d  %8d  %8d\n', n, c, c2 );

  end

  return
end
