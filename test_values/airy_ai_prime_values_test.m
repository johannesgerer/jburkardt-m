function airy_ai_prime_values_test ( )

%*****************************************************************************80
%
%% AIRY_AI_PRIME_VALUES_TEST demonstrates the use of AIRY_AI_PRIME_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'AIRY_AI_PRIME_VALUES_TEST:\n' );
  fprintf ( 1, '  AIRY_AI_PRIME_VALUES stores values of \n' );
  fprintf ( 1, '  the Airy function A''(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Ai''(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, aip ] = airy_ai_prime_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, aip );

  end

  return
end
