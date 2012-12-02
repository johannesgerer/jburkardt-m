function a = fibonacci3 ( n )

%*****************************************************************************80
%
%% FIBONACCI3 returns the Fibonacci3 matrix.
%
%  Example:
%
%    N = 5
%
%    1 -1  0  0  0
%    1  1 -1  0  0
%    0  1  1 -1  0
%    0  0  1  1 -1
%    0  0  0  1  1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is integral: int ( A ) = A.
%
%    The determinant of A is the Fibonacci number F(N+1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;

  for i = 2 : n
    a(i,i-1) = 1.0;
  end

  for i = 1 : n
    a(i,i) = 1.0;
  end

  for i = 1 : n-1
    a(i,i+1) = -1.0;
  end

  return
end
