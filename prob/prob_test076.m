function prob_test076 ( )

%*****************************************************************************80
%
%% TEST076 tests GAMMA_INC, GAMMA_INC_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST076:\n' );
  fprintf ( 1, '  GAMMA_INC evaluates the normalized incomplete Gamma\n' );
  fprintf ( 1, '    function P(A,X).\n' );
  fprintf ( 1, '  GAMMA_INC_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A     X       Exact F      GAMMA_INC(A,X)\n' );
  fprintf ( 1, '\n' );
  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = gamma_inc_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = gamma_inc ( a, x );

    fprintf ( 1, '  %8f  %8f  %14f  %14f\n', a, x, fx, fx2 );

  end

  return
end
