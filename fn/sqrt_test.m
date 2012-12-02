function sqrt_test ( )

%*****************************************************************************80
%
%% SQRT_TEST tests R4_SQRT and R8_SQRT.
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
  fprintf ( 1, 'SQRT_TEST:\n' );
  fprintf ( 1, '  Test SQRT_VALUES, R4_SQRT, R8_SQRT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         SQRT(X)\n' );
  fprintf ( 1, '                    R4_SQRT(X)        Diff\n' );
  fprintf ( 1, '                    R8_SQRT(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = sqrt_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_sqrt ( single ( x ) );
    fx3 = r8_sqrt ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
