function lobatto_polynomial_derivatives_test ( )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_DERIVATIVES_TEST tests LOBATTO_POLYNOMIAL_DERIVATIVES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_DERIVATIVES_TEST:\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_DERIVATIVES stores derivatives of\n' );
  fprintf ( 1, '  the completed Lobatto polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N    X            Lo''(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = lobatto_polynomial_derivatives ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %12f  %24.16f\n',  n, x, fx );

  end

  return
end
