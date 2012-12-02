function a = clement2 ( n )

%*****************************************************************************80
%
%% CLEMENT2 returns the Clement2 matrix.
%
%  Formula:
%
%    if ( J = I+1 )
%      A(I,J) = sqrt(I*(N-I))
%    else if ( I = J+1 )
%      A(I,J) = sqrt(J*(N-J))
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%       .    sqrt(4)    .       .       .
%    sqrt(4)    .    sqrt(6)    .       .
%       .    sqrt(6)    .    sqrt(6)    .
%       .       .    sqrt(6)    .    sqrt(4)
%       .       .       .    sqrt(4)    .
%
%  Properties:
%
%    A is tridiagonal.
%
%    A is banded, with bandwidth 3.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    The diagonal of A is zero.
%
%    A is singular if N is odd.
%
%    About 64 percent of the entries of the inverse of A are zero.
%
%    The eigenvalues are plus and minus the numbers
%
%      N-1, N-3, N-5, ..., (1 or 0).
%
%    If N is even,
%
%      det ( A ) = (-1)**(N/2) * (N-1) * (N+1)**(N/2)
%
%    and if N is odd,
%
%      det ( A ) = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Clement,
%    A class of triple-diagonal matrices for test purposes,
%    SIAM Review,
%    Volume 1, 1959, pages 50-52.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i + 1 )
        a(i,j) = sqrt ( i * ( n - i ) );
      elseif ( i == j + 1 )
        a(i,j) = sqrt ( j * ( n - j ) );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
