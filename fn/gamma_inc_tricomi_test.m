function gamma_inc_tricomi_test ( )

%*****************************************************************************80
%
%% GAMMA_INC_TRICOMI_TEST tests R4_GAMIT and R8_GAMIT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAMMA_INC_TRICOMI_TEST:\n' );
  fprintf ( 1, '  Test GAMMA_INC_TRICOMI_VALUES, R4_GAMIT, R8_GAMIT.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               X     GAMIT(A,X)\n' );
  fprintf ( 1, '                                R4_GAMIT(A,X)         Diff\n' );
  fprintf ( 1, '                                R8_GAMIT(A,X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx1 ] = gamma_inc_tricomi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_gamit ( single ( a ), single ( x ) );
    fx3 = r8_gamit ( a, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4g  %14.6g\n', a, x, fx1 );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
