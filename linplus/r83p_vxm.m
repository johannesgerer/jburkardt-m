function b = r83p_vxm ( n, a, x )

%*****************************************************************************80
%
%% R83P_VXM multiplies a vector by a R83P matrix.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as
%    a 3 by N array, in which each row corresponds to a diagonal, and
%    column locations are preserved.  The matrix value
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%  Example:
%
%    Here is how a R83P matrix of order 5 would be stored:
%
%      A51 A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54 A15
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 3.
%
%    Input, real A(3,N), the R83P matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product X * A.
%
  b(1) =   a(1,1)   * x(n)   + a(2,1) * x(1) + a(3,1)   * x(2);

  for i = 2 : n-1
    b(i) = a(1,i)   * x(i-1) + a(2,i) * x(i) + a(3,i)   * x(i+1);
  end

  b(n) =   a(1,n)   * x(n-1) + a(2,n) * x(n) + a(3,n)   * x(1);

  return
end
