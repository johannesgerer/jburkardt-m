function b = r83p_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R83P_TO_R8GE copies a R83P matrix to a R8GE matrix.
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
%    03 February 2004
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
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        b(i,j) = a(2,j);
      elseif ( j == i-1 )
        b(i,j) = a(3,j);
      elseif ( j == i+1 )
        b(i,j) = a(1,j);
      elseif ( i == 1 & j == n )
        b(i,j) = a(3,j);
      elseif ( i == n & j == 1 )
        b(i,j) = a(1,j);
      else
        b(i,j) = 0.0;
      end
    end
  end

  return
end
