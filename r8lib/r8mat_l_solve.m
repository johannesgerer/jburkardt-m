function x = r8mat_l_solve ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_L_SOLVE solves a lower triangular linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix A.
%
%    Input, real A(N,N), the N by N lower triangular matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%
  x(1:n) = 0.0;
%
%  Solve L * x = b.
%
  for i = 1 : n
    x(i) = ( b(i) - ( a(i,1:i-1) * x(1:i-1)' ) ) / a(i,i);
  end

  return
end
