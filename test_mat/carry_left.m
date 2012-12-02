function a = carry_left ( n  )

%*****************************************************************************80
%
%% CARRY_LEFT returns the Carry left eigenvector matrix.
%
%  Formula:
%
%    A(I,J) = sum ( 0 <= K <= J-1 )
%      (-1)**K * C(N+1,K) * ( J - K )**(N+1-I)
%
%  Example:
%
%    N = 4
%
%    1  11  11   1
%    1   3  -3  -1
%    1  -1  -1   1
%    1  -3   3  -1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    Column 1 is all 1's, and column N is (-1)**(I+1).
%
%    The top row is proportional to a row of Eulerian numbers, and
%    can be normalized to represent the stationary probablities
%    for the carrying process when adding N random numbers.
%
%    The bottom row is proportional to a row of Pascal's triangle,
%    with alternating signs.
%
%    The product of the left and right eigenvector matrices of
%    order N is N% times the identity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Holte,
%    Carries, Combinatorics, and an Amazing Matrix,
%    The American Mathematical Monthly,
%    February 1997, pages 138-149.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      s = -1.0;

      for k = 0 : j-1
        s = - s;
        a(i,j) = a(i,j) + s * comb ( n + 1, k ) * ( j - k )^(n+1-i);
      end

    end

  end

  return
end
