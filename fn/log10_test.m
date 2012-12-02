function log10_test ( )

%*****************************************************************************80
%
%% LOG10_TEST tests R4_LOG10 and R8_LOG10.
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
  fprintf ( 1, 'LOG10_TEST:\n' );
  fprintf ( 1, '  Test LOG10_VALUES, R4_LOG10, R8_LOG10.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X        LOG10(X)\n' );
  fprintf ( 1, '                   R4_LOG10(X)        Diff\n' );
  fprintf ( 1, '                   R8_LOG10(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = log10_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_log10 ( single ( x ) );
    fx3 = r8_log10 ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
