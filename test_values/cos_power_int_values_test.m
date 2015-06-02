function cos_power_int_values_test ( )

%*****************************************************************************80
%
%% COS_POWER_INT_VALUES_TEST demonstrates the use of COS_POWER_INT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COS_POWER_INT_VALUES_TEST:\n' );
  fprintf ( 1, '  COS_POWER_INT_VALUES returns values of \n' );
  fprintf ( 1, '  the N-th power of the cosine function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A      B      N      FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, n, fx ] = cos_power_int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8f  %8f  %6d  %24.16f\n', a, b, n, fx );

  end

  return
end
