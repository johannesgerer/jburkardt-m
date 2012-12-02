function gamma_inc_test ( )

%*****************************************************************************80
%
%% GAMMA_INC_TEST tests R4_GAMIC and R8_GAMIC.
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
  fprintf ( 1, 'GAMMA_INC_TEST:\n' );
  fprintf ( 1, '  Test GAMMA_INC_VALUES, R4_GAMIC, R8_GAMIC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               X     GAMIC(A,X)\n' );
  fprintf ( 1, '                                R4_GAMIC(A,X)         Diff\n' );
  fprintf ( 1, '                                R8_GAMIC(A,X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx1 ] = gamma_inc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_gamic ( single ( a ), single ( x ) );
    fx3 = r8_gamic ( a, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4f  %14.6g\n', a, x, fx1 );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
