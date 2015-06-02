function a = aegerter ( n )

%*****************************************************************************80
%
%% AEGERTER returns the AEGERTER matrix.
%
%  Formula:
%
%    if ( I == N )
%      A(I,J) = J
%    else if ( J == N )
%      A(I,J) = I
%    else if ( I == J )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%    1  0  0  0  1
%    0  1  0  0  2
%    0  0  1  0  3
%    0  0  0  1  4
%    1  2  3  4  5
%
%  Square Properties:
%
%    A is integral: int ( A ) = A.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is border-banded.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );
 
  for i = 1 : n
    for j = 1 : n

      if ( i == n )
        a(i,j) = j;
      elseif ( j == n )
        a(i,j) = i;
      elseif ( i == j )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end

