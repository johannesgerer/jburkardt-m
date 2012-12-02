function fac_test ( )

%*****************************************************************************80
%
%% FAC_TEST tests R4_FAC and R8_FAC.
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
  fprintf ( 1, 'FAC_TEST:\n' );
  fprintf ( 1, '  Test FACTORIAL_VALUES, R4_FAC, R8_FAC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             N          FAC(N)\n' );
  fprintf ( 1, '                     R4_FAC(N)        Diff\n' );
  fprintf ( 1, '                     R8_FAC(N)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fx1 ] = factorial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_fac ( n );
    fx3 = r8_fac ( n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14d  %14.6g\n', n, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
