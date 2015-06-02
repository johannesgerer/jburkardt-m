function omega_values_test ( )

%*****************************************************************************80
%
%% OEMGA_VALUES_TEST demonstrates the use of OMEGA_VALUES.
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
  fprintf ( 1, 'OMEGA_VALUES_TEST:\n' );
  fprintf ( 1, '  OMEGA_VALUES returns values of\n' );
  fprintf ( 1, '  the Omega function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N           OMEGA(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = omega_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8d  %10d\n', n, fn );

  end

  return
end
