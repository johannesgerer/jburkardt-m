function binom_test ( )

%*****************************************************************************80
%
%% BINOM_TEST tests R4_BINOM and R8_BINOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BINOM_TEST:\n' );
  fprintf ( 1, '  Test BINOM_VALUES, R4_BINOM, R8_BINOM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               B     BINOM(A,B)\n' );
  fprintf ( 1, '                                R4_BINOM(A,B)         Diff\n' );
  fprintf ( 1, '                                R8_BINOM(A,B)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, fx1 ] = binomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_binom ( a, b );
    fx3 = r8_binom ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14d  %14d  %14d\n', a, b, fx1 );
    fprintf ( 1, '                                  %14d  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14d  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
