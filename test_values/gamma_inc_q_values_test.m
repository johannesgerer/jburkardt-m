function gamma_inc_q_values_test ( )

%*****************************************************************************80
%
%% GAMMA_INC_Q_VALUES_TEST demonstrates the use of GAMMA_INC_Q_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GAMMA_INC_Q_VALUES_TEST:\n' );
  fprintf ( 1, '  GAMMA_INC_Q_VALUES stores values of\n' );
  fprintf ( 1, '  the incomplete Gamma Q function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A            X            F(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = gamma_inc_q_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', a, x, fx );

  end

  return
end
