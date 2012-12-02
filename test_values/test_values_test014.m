function test_values_test014 ( )

%*****************************************************************************80
%
%% TEST014 demonstrates the use of BERNOULLI_NUMBER_VALUES.
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
  fprintf ( 1, 'TEST014:\n' );
  fprintf ( 1, '  BERNOULLI_NUMBER_VALUES returns values of \n' );
  fprintf ( 1, '  the Bernoulli numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        BERNOULLI(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = bernoulli_number_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %24.16f\n', n, c );

  end

  return
end
