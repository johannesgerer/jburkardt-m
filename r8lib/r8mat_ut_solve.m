function x = r8mat_ut_solve ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_UT_SOLVE solves a transposed upper triangular linear system.
%
%  Discussion:
%
%    An R8MAT is an MxN array of R8's, stored by (I,J) -> [I+J*M].
%
%    Given the upper triangular matrix A, the linear system to be solved is:
%
%      A' * x = b
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns
%    of the matrix.
%
%    Input, real A(N,N), the N by N upper triangular matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%

%
%  Solve U' * x = b.
%
  for i = 1 : n
    x(i) = b(i);
    for j = 1 : i - 1
      x(i) = x(i) - a(j,i) * x(j);
    end
    x(i) = x(i) / a(i,i);
  end

  return
end
