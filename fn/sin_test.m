function sin_test ( )

%*****************************************************************************80
%
%% SIN_TEST tests R4_SIN and R8_SIN.
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
  fprintf ( 1, 'SIN_TEST:\n' );
  fprintf ( 1, '  Test SIN_VALUES, R4_SIN, R8_SIN.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         SIN(X)\n' );
  fprintf ( 1, '                    R4_SIN(X)         Diff\n' );
  fprintf ( 1, '                    R8_SIN(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = sin_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_sin ( single ( x ) );
    fx3 = r8_sin ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
