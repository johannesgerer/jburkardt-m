function acosh_test ( )

%*****************************************************************************80
%
%% ACOSH_TEST tests R4_ACOSH and R8_ACOSH.
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
  fprintf ( 1, 'ACOSH_TEST:\n' );
  fprintf ( 1, '  Test ARCCOSH_VALUES, R4_ACOSH, R8_ACOSH\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X      ARCCOSH(X)\n' );
  fprintf ( 1, '                   R4_ACOSH(X)        Diff\n' );
  fprintf ( 1, '                   R8_ACOSH(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = arccosh_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_acosh ( single ( x ) );
    fx3 = r8_acosh ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end