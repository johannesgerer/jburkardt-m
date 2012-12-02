function error_frobenius = r8mat_is_plu ( m, n, a, p, l, u )

%*****************************************************************************80
%
%% R8MAT_IS_PLU measures the error in a PLU factorization.
%
%  Discussion:
%
%    An R8MAT is a matrix of real values.
%
%    This routine simply returns the Frobenius norm of the M x N matrix:
%    A - P * L * U.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Input, real P(M,M), L(M,M), U(M,N), the PLU factors.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix A  - P * L * U.
%
  d(1:m,1:n) = a(1:m,1:n) - p(1:m,1:m) * l(1:m,1:m) * u(1:m,1:n);

  error_frobenius = r8mat_norm_fro ( m, n, d );

  return
end
