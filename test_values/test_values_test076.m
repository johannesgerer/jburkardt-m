function test_values_test076 ( )

%*****************************************************************************80
%
%% TEST076 demonstrates the use of GAMMA_VALUES.
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
  fprintf ( 1, 'TEST076:\n' );
  fprintf ( 1, '  GAMMA_VALUES stores values of the Gamma function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            GAMMA(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gamma_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16e\n', x, fx );

  end

  return
end
