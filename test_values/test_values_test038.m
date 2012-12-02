function test_values_test038 ( )

%*****************************************************************************80
%
%% TEST038 demonstrates the use of BETA_INC_VALUES.
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
  fprintf ( 1, 'TEST038:\n' );
  fprintf ( 1, '  BETA_INC_VALUES stores values of\n' );
  fprintf ( 1, '  the incomplete Beta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A            B            X            BETA_INC(A,B)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

     [ n_data, a, b, x, fx ] = beta_inc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', a, b, x, fx );

  end

  return
end
