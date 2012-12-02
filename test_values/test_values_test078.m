function test_values_test078 ( )

%*****************************************************************************80
%
%% TEST078 demonstrates the use of GAMMA_INC_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST078:\n' );
  fprintf ( 1, '  GAMMA_INC_VALUES stores values of\n' );
  fprintf ( 1, '  the incomplete Gamma function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A            X            GAMMA_INC(A)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = gamma_inc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', a, x, fx );

  end

  return
end
