function asin_test ( )

%*****************************************************************************80
%
%% ASIN_TEST tests R4_ASIN and R8_ASIN.
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
  fprintf ( 1, 'ASIN_TEST:\n' );
  fprintf ( 1, '  Test ARCSIN_VALUES, R4_ASIN, R8_ASIN\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X      ARCSIN(X)\n' );
  fprintf ( 1, '                   R4_ASIN(X)         Diff\n' );
  fprintf ( 1, '                   R8_ASIN(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = arcsin_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_asin ( single ( x ) );
    fx3 = r8_asin ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
