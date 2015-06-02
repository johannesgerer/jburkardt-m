function r8_gamma_log_test ( )

%*****************************************************************************80
%
%% R8_GAMMA_LOG_TEST tests R8_GAMMA_LOG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_GAMMA_LOG_TEST:\n' );
  fprintf ( 1, ...
    '  R8_GAMMA_LOG evaluates the logarithm of the Gamma function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            GAMMA_LOG(X)    R8_GAMMA_LOG(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = gamma_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_gamma_log ( x );

    fprintf ( 1, '  %12g  %24.16g  %24.16g\n', x, fx1, fx2 );

  end

  return
end
