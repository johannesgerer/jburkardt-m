function polpak_test060 ( )

%*****************************************************************************80
%
%% TEST060 tests LEGENDRE_FUNCTION_Q, LEGENDRE_FUNCTION_Q_VALUES.
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
  fprintf ( 1, 'TEST060:\n' );
  fprintf ( 1, '  LEGENDRE_FUNCTION_Q evaluates the Legendre Q function.\n' );
  fprintf ( 1, '  LEGENDRE_FUNCTION_Q_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X        Exact F       Q(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = legendre_function_q_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = legendre_function_q ( n, x );

    fprintf ( 1, '  %6d  %6f  %12f  %12f\n', n, x, fx, fx2(n+1) );

  end

  return
end
