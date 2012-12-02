function chebyshev_polynomial_test13 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST13 tests U_POLYNOMIAL_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST13:\n' );
  fprintf ( 1, '  T_POLYNOMIAL_ZEROS computes the zeros of U(n,x);\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X         U(n,x)\n' );

  for n = 1 : 5

    x = u_polynomial_zeros ( n );
    fx = u_polynomial ( n, n + 1, x );

    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %4d  %8.4f  %14.6g\n', i, x(i), fx(i,n+1) );
    end

  end

  return
end
