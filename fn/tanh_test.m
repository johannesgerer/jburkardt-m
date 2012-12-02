function tanh_test ( )

%*****************************************************************************80
%
%% TANH_TEST tests R4_TANH and R8_TANH.
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
  fprintf ( 1, 'TANH_TEST:\n' );
  fprintf ( 1, '  Test TANH_VALUES, R4_TANH, R8_TANH.\n' );
  fprintf ( 1, '  TANH_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         TANH(X)\n' );
  fprintf ( 1, '                    R4_TANH(X)         Diff\n' );
  fprintf ( 1, '                    R8_TANH(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = tanh_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_tanh ( single ( x ) );
    fx3 = r8_tanh ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
