function cheby_t_poly_values_test ( )

%*****************************************************************************80
%
%% CHEBY_T_POLY_VALUES_TEST demonstrates the use of CHEBY_T_POLY_VALUES.
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
  fprintf ( 1, 'CHEBY_T_POLY_VALUES_TEST:\n' );
  fprintf ( 1, '  CHEBYS_T_POLY_VALUES returns values of\n' );
  fprintf ( 1, '  the Chebyshev T polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N       X      T(N)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = cheby_t_poly_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %8f  %24.16f\n', n, x, fx );

  end

  return
end
