function error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda )

%*****************************************************************************80
%
%% R8MAT_IS_EIGEN_RIGHT determines the error in a (right) eigensystem.
%
%  Discussion:
%
%    An R8MAT is a matrix of real values.
%
%    This routine computes the Frobenius norm of
%
%      A * X - X * LAMBDA
%
%    where
%
%      A is an N by N matrix,
%      X is an N by K matrix (each of K columns is an eigenvector)
%      LAMBDA is a K by K diagonal matrix of eigenvalues.
%
%    This routine assumes that A, X and LAMBDA are all real.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer K, the number of eigenvectors.
%    K is usually 1 or N.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real X(N,K), the K eigenvectors.
%
%    Input, real LAMBDA(K), the K eigenvalues.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix A * X - X * LAMBDA, which would be exactly zero
%    if X and LAMBDA were exact eigenvectors and eigenvalues of A.
%
  c(1:n,1:k) = a(1:n,1:n) * x(1:n,1:k);

  for j = 1 : k
    c(1:n,j) = c(1:n,j) - lambda(j) * x(1:n,j);
  end

  error_frobenius = r8mat_norm_fro ( n, k, c );

  return
end
