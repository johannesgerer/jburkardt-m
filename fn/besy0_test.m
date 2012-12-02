function besy0_test ( )

%*****************************************************************************80
%
%% BESY0_TEST tests R4_BESY0 and R8_BESY0.
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
  fprintf ( 1, 'BESY0_TEST:\n' );
  fprintf ( 1, '  Test BESY0_VALUES, R4_BESY0, R8_BESY0\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X       BESY0(X)\n' );
  fprintf ( 1, '                  R4_BESY0(X)         Diff\n' );
  fprintf ( 1, '                  R8_BESY0(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = bessel_y0_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_besy0 ( single ( x ) );
    fx3 = r8_besy0 ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
