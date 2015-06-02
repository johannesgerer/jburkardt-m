function x = r8mat_u_solve ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_U_SOLVE solves an upper triangular linear system.
%
%  Discussion:
%
%    An R8MAT is an MxN array of R8's, stored by (I,J) -> [I+J*M].
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
%    Input, integer N, the number of rows and columns of
%    the matrix A.
%
%    Input, real A(N,N), the N by N upper triangular matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%

%
%  Solve U * x = b.
%
  for i = n : -1 : 1
    x(i) = b(i);
    for j = i + 1 : n
      x(i) = x(i) - a(i,j) * x(j);
    end
    x(i) = x(i) / a(i,i);
  end

  return
end