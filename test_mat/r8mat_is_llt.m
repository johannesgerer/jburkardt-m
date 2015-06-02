function error_frobenius = r8mat_is_llt ( m, n, a, l )

%*****************************************************************************80
%
%% R8MAT_IS_LLT measures the error in a Cholesky factorization.
%
%  Discussion:
%
%    An R8MAT is a matrix of real values.
%
%    This routine simply returns the Frobenius norm of the M x M matrix:
%      A - L * L' 
%    where L is an M by N lower triangular matrix presumed to be the
%    Cholesky factor of A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, real A(M,M), the matrix.
%
%    Input, real L(M,N), the Cholesky factor.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm of A - L*L'.
%
  d = a - l * l';

  error_frobenius = r8mat_norm_fro ( m, m, d );

  return
end
