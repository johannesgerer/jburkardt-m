function subset_test0305 ( )

%*****************************************************************************80
%
%% TEST0305 tests GAMMALN, GAMMA_LOG_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0305:\n' );
  fprintf ( 1, '  GAMMALN evaluates the logarithm of the \n' );
  fprintf ( 1, '    Gamma function.\n' );
  fprintf ( 1, '  GAMMA_LOG_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X       Exact F         GAMMALN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gamma_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = gammaln ( x );

    fprintf ( 1, '  %8f  %16e  %16e\n', x, fx, fx2 );

  end

  return
end
