function a = oto ( m, n )

%*****************************************************************************80
%
%% OTO returns the OTO matrix.
%
%  Example:
%
%    N = 5
%
%    2  1  .  .  .
%    1  2  1  .  .
%    .  1  2  1  .
%    .  .  1  2  1
%    .  .  .  1  2
%
%  Properties:
%
%    A is banded, with bandwidth 3.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is integral: int ( A ) = A.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is weakly diagonally dominant, but not strictly diagonally dominant.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      if ( j == i - 1 )
        a(i,j) = 1.0;
      elseif ( j == i )
        a(i,j) = 2.0;
      elseif ( j == i + 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
