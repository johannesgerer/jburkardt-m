function beta_test ( )

%*****************************************************************************80
%
%% BETA_TEST tests R4_BETA and R8_BETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BETA_TEST:\n' );
  fprintf ( 1, '  Test BETA_VALUES, R4_BETA, R8_BETA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               B      BETA(A,B)\n' );
  fprintf ( 1, '                                 R4_BETA(A,B)         Diff\n' );
  fprintf ( 1, '                                 R8_BETA(A,B)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, fx1 ] = beta_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_beta ( single ( a ), single ( b ) );
    fx3 = r8_beta ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4f  %14.6g\n', a, b, fx1 );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
