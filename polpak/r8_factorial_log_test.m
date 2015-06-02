function r8_factorial_log_test ( )

%*****************************************************************************80
%
%% R8_FACTORIAL_LOG_TEST tests R8_FACTORIAL_LOG.
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
  fprintf ( 1, 'R8_FACTORIAL_LOG_TEST:\n' );
  fprintf ( 1, '  R8_FACTORIAL_LOG evaluates the logarithm of the \n' );
  fprintf ( 1, '  factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N	   Exact F	R8_FACTORIAL_LOG(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = r8_factorial_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fn2 = r8_factorial_log ( n );

    fprintf ( 1, '  %4d  %12f  %12f\n', n, fn, fn2 );

  end

  return
end
