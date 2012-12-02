function a = clement1 ( n )

%*****************************************************************************80
%
%% CLEMENT1 returns the Clement1 matrix.
%
%  Formula:
%
%    if ( J = I+1 )
%      A(I,J) = I
%    else if ( J = I-1 )
%      A(I,J) = N-I
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%    . 1 . . .
%    4 . 2 . .
%    . 3 . 3 .
%    . . 2 . 4
%    . . . 1 .
%
%  Properties:
%
%    A is banded, with bandwidth 3.
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
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
%      det ( A ) = (-1)**(N/2) * ( N - 1 ) * ( N + 1 )**(N/2)
%
%    and if N is odd,
%
%      det ( A ) = 0.
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
      if ( j == i+1 )
        a(i,j) = i;
      elseif ( j == i-1 )
        a(i,j) = n - j;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
