function a = clement3 ( n, x, y )

%*****************************************************************************80
%
%% CLEMENT3 returns the Clement3 matrix.
%
%  Formula:
%
%    if ( J = I + 1 ) then
%      A(I,J) = X(I)
%    else if ( I = J + 1 ) then
%      A(I,J) = Y(J)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5, X and Y arbitrary:
%
%       .   X(1)    .     .     .
%     Y(1)   .    X(2)    .     .
%       .   Y(2)    .   X(3)    .
%       .     .   Y(3)    .   X(4)
%       .     .     .   Y(4)    .
%
%    N = 5, X=(1,2,3,4), Y=(5,6,7,8):
%
%       .     1     .     .     .
%       5     .     2     .     .
%       .     6     .     3     .
%       .     .     7     .     4
%       .     .     .     8     .
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    The Clement1 and Clement2 matrices are special cases of this one.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    The diagonal of A is zero.
%
%    A is singular if N is odd.
%
%    About 64 percent of the entries of the inverse of A are zero.
%
%    If N is even,
%
%      det ( A ) = (-1)**(N/2) * product ( 1 <= I <= N/2 )
%        ( X(2*I-1) * Y(2*I-1) )
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
%    Alan Edelman, Eric Kostlan,
%    The road from Kac's matrix to Kac's random polynomials.
%    In Proceedings of the Fifth SIAM Conference on Applied Linear Algebra,
%    edited by John Lewis,
%    SIAM, 1994,
%    pages 503-507.
%
%    Robert Gregory, David Karney,
%    Example 3.19,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 46, 
%    LC: QA263.G68.
%
%    Olga Taussky, John Todd,
%    Another look at a matrix of Mark Kac,
%    Linear Algebra and Applications,
%    Volume 150, 1991, pages 341-360.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N-1), Y(N-1), the first super and
%    subdiagonals of the matrix A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i + 1 )
        a(i,j) = x(i);
      elseif ( i == j + 1 )
        a(i,j) = y(j);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
