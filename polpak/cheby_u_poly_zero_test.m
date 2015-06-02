function cheby_u_poly_zero_test ( )

%*****************************************************************************80
%
%% CHEBY_U_POLY_ZERO_TEST tests CHEBY_U_POLY_ZERO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2015
%
%  Author:
%
%    John Burkardt
%
  n_max = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBY_U_POLY_ZERO_TEST:\n' );
  fprintf ( 1, '  CHEBY_U_POLY_ZERO returns zeroes of the U(N)(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N      X        U(N)(X)\n' );
  fprintf ( 1, '\n' );

  for n = 1 : n_max

    z = cheby_u_poly_zero ( n );

    for i = 1 : n

      fx = cheby_u_poly ( 1, n, z(i) );

      fprintf ( 1, '  %8d  %8d  %14e\n', n, z(i), fx(n+1) );

    end

    fprintf ( 1, '\n' );

  end

  return
end
