function x = r8mat_lt_solve ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_LT_SOLVE solves a transposed lower triangular linear system.
%
%  Discussion:
%
%    Given the lower triangular matrix A, the linear system to be solved is:
%
%      A' * x = b
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
%  Solve L'*x = b.
%
  for i = n : -1 : 1
    x(i) = ( b(i) - x(i+1:n) * a(i+1:n,i) ) / a(i,i);
  end

  return
end
