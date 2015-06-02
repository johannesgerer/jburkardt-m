function x = r8mat_cholesky_solve ( n, r, b )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_SOLVE_UPPER solves Cholesky factored linear system A * x = b.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix A.
%
%    Input, real R(N,N), the N by N upper Cholesky factor of the
%    system matrix A.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%

%
%  Solve R' * y = b.
%
  x = r8mat_ut_solve ( n, r, b );
%
%  Solve R * x = y.
%
  x = r8mat_u_solve ( n, r, x );

  return
end
