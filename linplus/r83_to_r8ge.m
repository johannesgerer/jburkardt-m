function b = r83_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R83_TO_R8GE copies an R83 matrix to a R8GE matrix.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
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
%    30 January 2004
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
%    Input, real A(3,N), the R83 matrix.
%
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i-1 )
        b(i,j) = a(3,j);
      elseif ( j == i )
        b(i,j) = a(2,j);
      elseif ( j == i+1 )
        b(i,j) = a(1,j);
      else
        b(i,j) = 0.0;
      end

    end
  end

  return
end
