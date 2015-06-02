function hermite_poly_prob_values_test ( )

%*****************************************************************************80
%
%% HERMITE_POLY_PROB_VALUES_TEST demonstrates the use of HERMITE_POLY_PROB_VALUES.
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
  fprintf ( 1, 'HERMITE_POLY_PROB_VALUES_TEST:\n' );
  fprintf ( 1, '  HERMITE_POLY_PROB_VALUES stores values of\n' );
  fprintf ( 1, '  the probabilist''s Hermite polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            He(N,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = hermite_poly_prob_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16e\n', n, x, fx );

  end

  return
end
