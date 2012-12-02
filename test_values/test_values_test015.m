function test_values_test015 ( )

%*****************************************************************************80
%
%% TEST015 demonstrates the use of BERNOULLI_POLY_VALUES.
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
  fprintf ( 1, 'TEST015:\n' );
  fprintf ( 1, '  BERNOULLI_POLY_VALUES stores values of\n' );
  fprintf ( 1, '  the Bernoulli polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N            X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = bernoulli_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %12f  %24.16f\n', n, x, fx );

  end

  return
end
