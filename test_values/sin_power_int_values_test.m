function sin_power_int_values_test ( )

%*****************************************************************************80
%
%% SIN_POWER_INT_VALUES_TEST demonstrates the use of SIN_POWER_INT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIN_POWER_INT_VALUES_TEST:\n' );
  fprintf ( 1, '  SIN_POWER_INT_VALUES returns values of \n' );
  fprintf ( 1, '  the N-th power of the SIN function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A      B      N      FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, n, fx ] = sin_power_int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8f  %8f  %6d  %24.16f\n', a, b, n, fx );

  end

  return
end
