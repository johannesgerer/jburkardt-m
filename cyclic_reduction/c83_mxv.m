function b = c83_mxv ( n, a, x )

%*****************************************************************************80
%
%% C83_MXV multiplies a C83 matrix times a vector.
%
%  Discussion:
%
%    The C83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a C83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input, complex A(3,N), the C83 matrix.
%
%    Input, complex X(N), the vector to be multiplied by A.
%
%    Output, complex B(N), the product A * x.
%
  b = zeros ( n, 1 );
%
%  Force X to be a column vector.
%
  x = x ( : );

  b(1:n,1)   =              a(2,1:n)'   .* x(1:n,1);
  b(1:n-1,1) = b(1:n-1,1) + a(1,2:n)'   .* x(2:n,1);
  b(2:n,1)   = b(2:n,1)   + a(3,1:n-1)' .* x(1:n-1,1);

  return
end
