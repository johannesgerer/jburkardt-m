function besy1_test ( )

%*****************************************************************************80
%
%% BESY1_TEST tests R4_BESY1 and R8_BESY1.
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
  fprintf ( 1, 'BESY1_TEST:\n' );
  fprintf ( 1, '  Test BESY1_VALUES, R4_BESY1, R8_BESY1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X       BESY1(X)\n' );
  fprintf ( 1, '                  R4_BESY1(X)         Diff\n' );
  fprintf ( 1, '                  R8_BESY1(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = bessel_y1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_besy1 ( single ( x ) );
    fx3 = r8_besy1 ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
