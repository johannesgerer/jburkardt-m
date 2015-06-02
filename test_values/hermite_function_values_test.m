function hermite_function_values_test ( )

%*****************************************************************************80
%
%% HERMITE_FUNCTION_VALUES_TEST demonstrates the use of HERMITE_FUNCTION_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_FUNCTION_VALUES_TEST:\n' );
  fprintf ( 1, '  HERMITE_FUNCTION_VALUES stores values of\n' );
  fprintf ( 1, '  the Hermite function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            Hf(N,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = hermite_function_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16e\n', n, x, fx );

  end

  return
end
