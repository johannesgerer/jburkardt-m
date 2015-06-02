function r8mat_symm_jacobi_test ( )

%*****************************************************************************80
%
%% R8MAT_SYMM_JACOBI_TEST tests R8MAT_SYMM_JACOBI;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_SYMM_JACOBI_TEST\n' );
  fprintf ( 1, '  For a symmetric R8MAT:\n' );
  fprintf ( 1, '  R8MAT_SYMM_JACOBI diagonalizes;\n' );
%
%  Choose the eigenvalues.
%
  x = r8vec_indicator1 ( n );
%
%  Choose the eigenvectors.
%
  seed = 123456789;
  [ q, seed ] = r8mat_orth_uniform ( n, seed );
%
%  Compute A = Q*X*Q.
%
  a = r8mat_symm_eigen ( n, x, q );

  r8mat_print ( n, n, a, '  Matrix to diagonalize:' );

  a = r8mat_symm_jacobi ( n, a );;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed Eigenvalues:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %f\n', a(i,i) );
  end

  return
end
