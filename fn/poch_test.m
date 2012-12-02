function poch_test ( )

%*****************************************************************************80
%
%% POCH_TEST tests R4_POCH and R8_POCH.
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
  fprintf ( 1, 'POCH_TEST:\n' );
  fprintf ( 1, '  Test POCHHAMMER_VALUES, R4_POCH, R8_POCH.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               X      POCH(A,X)\n' );
  fprintf ( 1, '                                 R4_POCH(A,X)         Diff\n' );
  fprintf ( 1, '                                 R8_POCH(A,X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx1 ] = pochhammer_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_poch ( single ( a ), single ( x ) );
    fx3 = r8_poch ( a, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4g  %14.6g\n', a, x, fx1 );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
