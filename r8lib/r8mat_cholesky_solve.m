function x = r8mat_cholesky_solve ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_SOLVE solves a Cholesky factored linear system A * x = b.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix A.
%
%    Input, real A(N,N), the N by N Cholesky factor of the
%    system matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%

%
%  Solve L * y = b.
%
  x = r8mat_l_solve ( n, a, b );
%
%  Solve L' * x = y.
%
  x = r8mat_lt_solve ( n, a, x );

  return
end
