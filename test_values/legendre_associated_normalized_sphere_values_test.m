function legendre_associated_normalized_sphere_values_test ( )

%*****************************************************************************80
%
%% LEGENDRE_ASSOCIATED_NORMALIZED_SPHERE_VALUES_TEST1016 tests LEGENDRE_ASSOCIATED_NORMALIZED_SPHERE_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_ASSOCIATED_NORMALIZED_SPHERE_VALUES_TEST:\n' );
  fprintf ( 1, '  LEGENDRE_ASSOCIATED_NORMALIZED_SPHERE_VALUES stores values of\n' );
  fprintf ( 1, '  the associated Legendre polynomials, normalized for a sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     M    X             P(N,M)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx ] = legendre_associated_normalized_sphere_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %12f  %24.16f\n', n, m, x, fx );

  end

  return
end
