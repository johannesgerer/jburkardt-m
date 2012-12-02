subroutine c83_indicator ( n, a )

%*****************************************************************************80
%
%% C83_INDICATOR sets up a C83 indicator matrix.
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
%    Input, integer N, the order of the matrix.
%    N must be at least 2.
%
%    Output, complex A(3,N), the indicator matrix.
%
  a = zeros ( 3, n );

  a(1,1) = 0.0;
  for j = 2 : n
    a(1,j) = j - 1 + j * i;
  end

  for j = 1 : n
    a(2,j) = j + j * i;
  end

  for j = 1 : n - 1
    i = j + 1
    a(3,j) = j + 1 + j * i;
  end
  a(3,n) = 0.0;

  return
end
