function besk1_test ( )

%*****************************************************************************80
%
%% BESK1_TEST tests R4_BESK1 and R8_BESK1.
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
  fprintf ( 1, 'BESK1_TEST:\n' );
  fprintf ( 1, '  Test BESK1_VALUES, R4_BESK1, R8_BESK1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X       BESK1(X)\n' );
  fprintf ( 1, '                  R4_BESK1(X)         Diff\n' );
  fprintf ( 1, '                  R8_BESK1(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = bessel_k1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_besk1 ( single ( x ) );
    fx3 = r8_besk1 ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
