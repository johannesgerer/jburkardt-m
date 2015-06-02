function legendre_function_q_values_test ( )

%*****************************************************************************80
%
%% LEGENDRE_FUNCTION_Q_VALUES_TEST tests LEGENDRE_FUNCTION_Q_VALUES.
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
  fprintf ( 1, 'LEGENDRE_FUNCTION_Q_VALUES_TEST:\n' );
  fprintf ( 1, '  LEGENDRE_FUNCTION_Q_VALUES stores values of\n' );
  fprintf ( 1, '  the Legendre Q functions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N    X             Q(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = legendre_function_q_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16f\n', n, x, fx );

  end

  return
end
