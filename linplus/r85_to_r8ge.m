function b = r85_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R85_TO_R8GE copies a R85 matrix into a R8GE matrix.
%
%  Discussion:
%
%    The R85 storage format represents a pentadiagonal matrix as a 5 
%    by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  Thus, the original matrix is 
%    "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R85 matrix of order 6 would be stored:
%
%       *   *  A13 A24 A35 A46
%       *  A12 A23 A34 A45 A56
%      A11 A22 A33 A44 A55 A66
%      A21 A32 A43 A54 A65  *
%      A31 A42 A53 A64  *   *
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
%    Input, real A(5,N), the R85 matrix.
%
%    Output, real A(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i-2 )
        b(i,j) = a(1,i);
      elseif ( j == i-1 )
        b(i,j) = a(2,i);
      elseif ( i == j )
        b(i,j) = a(3,i);
      elseif ( j == i+1 )
        b(i,j) = a(4,i);
      elseif ( j == i+2 )
        b(i,j) = a(5,i);
      else
        b(i,j) = 0.0;
      end

    end
  end

  return
end

