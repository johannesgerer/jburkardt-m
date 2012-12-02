function test_values_test084 ( )

%*****************************************************************************80
%
%% TEST084 demonstrates the use of HERMITE_POLY_PHYS_VALUES.
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
  fprintf ( 1, 'TEST084:\n' );
  fprintf ( 1, '  HERMITE_POLY_PHYS_VALUES stores values of\n' );
  fprintf ( 1, '  the physicist''s Hermite polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            H(N,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = hermite_poly_phys_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16e\n', n, x, fx );

  end

  return
end
