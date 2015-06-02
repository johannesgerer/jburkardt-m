function r8plu_mul_test ( )

%*****************************************************************************80
%
%% R8PLU_MUL_TEST tests R8PLU_MUL;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8PLU_MUL_TEST\n' );
  fprintf ( 1, '  R8PLU_MUL computes the product A*x=b\n' );
  fprintf ( 1, '  using the compressed PLU factors of A.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  r8mat_print ( n, n, a, '  The matrix A:' );
%
%  Set the right hand side B1.
%
  for i = 1 : n
    x(i) = i;
  end

  b(1:n) = a(1:n,1:n) * x(1:n)';

  r8vec_print ( n, b, '  The right hand side B (computed from A):' );
%
%  Factor the matrix.
%
  [ pivot, lu, info ] = r8mat_to_r8plu ( n, a );
%
%  Compute the matrix-vector product.
%
  b = r8plu_mul ( n, pivot, lu, x );

  r8vec_print ( n, b, '  The right hand side B (computed from PLU):' );

  return
end
