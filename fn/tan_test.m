function tan_test ( )

%*****************************************************************************80
%
%% TAN_TEST tests R4_TAN and R8_TAN.
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
  fprintf ( 1, 'TAN_TEST:\n' );
  fprintf ( 1, '  Test TAN_VALUES, R4_TAN, R8_TAN.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         TAN(X)\n' );
  fprintf ( 1, '                    R4_TAN(X)         Diff\n' );
  fprintf ( 1, '                    R8_TAN(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = tan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_tan ( single ( x ) );
    fx3 = r8_tan ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
