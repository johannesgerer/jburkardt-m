function test_values_test039 ( )

%*****************************************************************************80
%
%% TEST039 demonstrates the use of BETA_LOG_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST039:\n' );
  fprintf ( 1, '  BETA_LOG_VALUES stores values of\n' );
  fprintf ( 1, '  the logarithm of the Beta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X              Y         BETA_LOG(X,Y)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, fxy ] = beta_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', x, y, fxy );

  end

  return
end
