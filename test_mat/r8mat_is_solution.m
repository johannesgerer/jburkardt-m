function error_frobenius = r8mat_is_solution ( m, n, k, a, x, b, error )

%*****************************************************************************80
%
%% R8MAT_IS_SOLUTION measures the error in a linear system solution.
%
%  Discussion:
%
%    An R8MAT is a matrix of real values.
%
%    The system matrix A is an M x N matrix.
%    It is not required that A be invertible.
%
%    The solution vector X is actually allowed to be an N x K matrix.
%
%    The right hand side "vector" B is actually allowed to be an M x K matrix.
%
%    This routine simply returns the Frobenius norm of the M x K matrix:
%    A * X - B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, K, the order of the matrices.
%
%    Input, real A(M,N), X(N,K), B(M,K), the matrices.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix A * X - B, which would be exactly zero
%    if X was the "solution" of the linear system.
%
  c(1:m,1:k) = a(1:m,1:n) * x(1:n,1:k) - b(1:m,1:k);

  error_frobenius = r8mat_norm_fro ( m, k, c );

  return
end
