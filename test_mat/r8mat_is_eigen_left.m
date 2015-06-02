function error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda )

%*****************************************************************************80
%
%% R8MAT_IS_EIGEN_LEFTT determines the error in a left eigensystem.
%
%  Discussion:
%
%    An R8MAT is a matrix of real values.
%
%    This routine computes the Frobenius norm of
%
%      X * A - LAMBDA * X
%
%    where
%
%      A is an N by N matrix,
%      X is an K by N matrix (each of K columns is an eigenvector)
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
%    16 March 2015
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
%    Input, real X(K,N), the K eigenvectors.
%
%    Input, real LAMBDA(K), the K eigenvalues.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of X*A-LAMBDA*X.
%
  c = x * a;

  for i = 1 : k
    c(i,1:n) = c(i,1:n) - lambda(i) * x(i,1:n);
  end

  error_frobenius = r8mat_norm_fro ( k, n, c );

  return
end
