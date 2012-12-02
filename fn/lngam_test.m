function lngam_test ( )

%*****************************************************************************80
%
%% LNGAM_TEST tests R4_LNGAM and R8_LNGAM.
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
  fprintf ( 1, 'LNGAM_TEST:\n' );
  fprintf ( 1, '  Test GAMMA_LOG_VALUES, R4_LNGAM, R8_LNGAM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X        LNGAM(X)\n' );
  fprintf ( 1, '                   R4_LNGAM(X)        Diff\n' );
  fprintf ( 1, '                   R8_LNGAM(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = gamma_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_lngam ( single ( x ) );
    fx3 = r8_lngam ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
