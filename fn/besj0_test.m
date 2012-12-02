function besj0_test ( )

%*****************************************************************************80
%
%% BESJ0_TEST tests R4_BESJ0 and R8_BESJ0.
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
  fprintf ( 1, 'BESJ0_TEST:\n' );
  fprintf ( 1, '  Test BESJ0_VALUES, R4_BESJ0, R8_BESJ0\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X       BESJ0(X)\n' );
  fprintf ( 1, '                  R4_BESJ0(X)         Diff\n' );
  fprintf ( 1, '                  R8_BESJ0(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = bessel_j0_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_besj0 ( single ( x ) );
    fx3 = r8_besj0 ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
