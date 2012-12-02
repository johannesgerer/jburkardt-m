function lbeta_test ( )

%*****************************************************************************80
%
%% LBETA_TEST tests R4_LBETA and R8_LBETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LBETA_TEST:\n' );
  fprintf ( 1, '  Test BETA_LOG_VALUES, R4_LBETA, R8_LBETA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               B     LBETA(A,B)\n' );
  fprintf ( 1, '                                R4_LBETA(A,B)         Diff\n' );
  fprintf ( 1, '                                R8_LBETA(A,B)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, fx1 ] = beta_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_lbeta ( single ( a ), single ( b ) );
    fx3 = r8_lbeta ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4g  %14.6g\n', a, b, fx1 );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  return
end
