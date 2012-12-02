function int_test ( )

%*****************************************************************************80
%
%% INT_TEST tests R4_INT and R8_INT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_TEST:\n' );
  fprintf ( 1, '  Test INT_VALUES, R4_INT, R8_INT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         INT(X)\n' );
  fprintf ( 1, '                    R4_INT(X)        Diff\n' );
  fprintf ( 1, '                    R8_INT(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_int ( single ( x ) );
    fx3 = r8_int ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
