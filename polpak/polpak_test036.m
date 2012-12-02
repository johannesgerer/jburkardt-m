function polpak_test036 ( )

%*****************************************************************************80
%
%% TEST036 tests R8_GAMMA_LOG, GAMMA_LOG_VALUES.
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
  fprintf ( 1, 'TEST036:\n' );
  fprintf ( 1, '  GAMMA_LOG evaluates the logarithm of the\n' );
  fprintf ( 1, '    Gamma function.\n' );
  fprintf ( 1, '  GAMMA_LOG_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X       Exact F       GAMMA_LOG(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gamma_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_gamma_log ( x );

    fprintf ( 1, '  %6f  %16f  %16f\n', x, fx, fx2 );

  end

  return
end
