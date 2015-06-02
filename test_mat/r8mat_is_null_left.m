function error_l2 = r8mat_is_null_left ( m, n, a, x )

%*****************************************************************************80
%
%% R8MAT_IS_NULL_LEFT determines if x is a left null vector of matrix A.
%
%  Discussion:
%
%    The nonzero M vector x is a left null vector of the MxN matrix A if
%
%      x'*A = A'*x = 0
%
%    If A is a square matrix, then this implies that A is singular.
%
%    If A is a square matrix, this implies that 0 is an eigenvalue of A,
%    and that x is an associated eigenvector.
%
%    This routine returns 0 if x is exactly a left null vector of A.
%
%    It returns a "huge" value if x is the zero vector.
%
%    Otherwise, it returns the L2 norm of A' * x divided by the L2 norm of x:
%
%      ERROR_L2 = NORM_L2 ( A' * x ) / NORM_L2 ( x )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the row and column dimensions of 
%    the matrix.  M and N must be positive.
%
%    Input, real A(M,N), the matrix.
%
%    Input, real X(M), the vector.
%
%    Output, real ERROR_L2, the result.
%    0.0 indicates that X is exactly a left null vector.
%    A "huge" value indicates that ||x|| = 0;
%    Otherwise, the value returned is a relative error ||A'*x||/||x||.
%
  x = x(:);

  x_norm = sqrt ( sum ( x(1:m).^2 ) );

  if ( x_norm == 0.0 )
    error_l2 = Inf;
    return
  end

  atx = a' * x;

  atx_norm = sqrt ( sum ( atx(1:n).^2 ) );

  error_l2 = atx_norm / x_norm;

  return
end
