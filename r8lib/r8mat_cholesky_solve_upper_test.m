function r8mat_cholesky_solve_upper_test ( )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_SOLVE_UPPER_TEST tests R8MAT_CHOLESKY_SOLVE_UPPER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2013
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_CHOLESKY_SOLVE_UPPER_TEST\n' );
  fprintf ( 1, '  For a positive definite symmetric matrix,\n' );
  fprintf ( 1, '  R8MAT_CHOLESKY_SOLVE_UPPER solves a linear system\n' );
  fprintf ( 1, '  using the upper Cholesky factorization.\n' );

  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 2.0;
      elseif ( abs ( i - j ) == 1 )
        a(i,j) = -1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  r8mat_print ( n, n, a, '  Matrix to be factored:' );
%
%  Compute a Cholesky factor.
%
  r = r8mat_cholesky_factor_upper ( n, a );
  r8mat_print ( n, n, r, '  Cholesky factor R:' );
  d(1:n,1:n) = r(1:n,1:n)' * r(1:n,1:n);
  r8mat_print ( n, n, d, '  Product R'' * R:' );
%
%  Solve a linear system.
%
  b(1:n-1) = 0.0;
  b(n) = n + 1;
  r8vec_print ( n, b, '  Right hand side:' );

  x = r8mat_cholesky_solve_upper ( n, r, b );

  r8vec_print ( n, x, '  Computed solution:' );

  return
end


