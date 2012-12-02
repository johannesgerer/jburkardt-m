function chebyshev_polynomial_test04 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST04 tests T_POLYNOMIAL_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST04:\n' );
  fprintf ( 1, '  T_POLYNOMIAL_ZEROS computes the zeros of T(n,x);\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X         T(n,x)\n' );

  for n = 1 : 5

    x = t_polynomial_zeros ( n );
    fx = t_polynomial ( n, n + 1, x );

    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %4d  %8.4f  %14.6g\n', i, x(i), fx(i,n+1) );
    end

  end

  return
end
