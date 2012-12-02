function atan2_test ( )

%*****************************************************************************80
%
%% ATAN2_TEST tests R4_ATAN2 and R8_ATAN2.
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
  fprintf ( 1, 'ATAN2_TEST:\n' );
  fprintf ( 1, '  Test ARCTAN2_VALUES, R4_ATAN2, R8_ATAN2\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X               Y   ARCTAN2(Y,X)\n' );
  fprintf ( 1, '                                R4_ATAN2(Y,X)         Diff\n' );
  fprintf ( 1, '                                R8_ATAN2(Y,X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, fx1 ] = arctan2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_atan2 ( single ( y ), single ( x ) );
    fx3 = r8_atan2 ( y, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4f  %14.6g\n', x, y, fx1 );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
