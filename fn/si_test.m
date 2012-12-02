function si_test ( )

%*****************************************************************************80
%
%% SI_TEST tests R4_SI and R8_SI.
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
  fprintf ( 1, 'SI_TEST:\n' );
  fprintf ( 1, '  Test SI_VALUES, R4_SI, R8_SI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X           SI(X)\n' );
  fprintf ( 1, '                      R4_SI(X)        Diff\n' );
  fprintf ( 1, '                      R8_SI(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = si_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_si ( single ( x ) );
    fx3 = r8_si ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
