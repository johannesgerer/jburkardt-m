function a = wilk21 ( n )

%*****************************************************************************80
%
%% WILK21 returns the WILK21 matrix.
%
%  Discussion:
%
%    By using values of N not equal to 21, WILK21 can return a variety
%    of related matrices.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = nint ( abs ( i - real ( n+1 ) / 2.0 ) )
%    elseif ( I = J - 1 or I = J + 1 )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 21
%
%    10  1  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%     1  9  1  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%     .  1  8  1  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%     .  .  1  7  1  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%     .  .  .  1  6  1  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%     .  .  .  .  1  5  1  .  .  .  .  .  .  .  .  .  .  .  .  .  .
%     .  .  .  .  .  1  4  1  .  .  .  .  .  .  .  .  .  .  .  .  .
%     .  .  .  .  .  .  1  3  1  .  .  .  .  .  .  .  .  .  .  .  .
%     .  .  .  .  .  .  .  1  2  1  .  .  .  .  .  .  .  .  .  .  .
%     .  .  .  .  .  .  .  .  1  1  1  .  .  .  .  .  .  .  .  .  .
%     .  .  .  .  .  .  .  .  .  1  0  1  .  .  .  .  .  .  .  .  .
%     .  .  .  .  .  .  .  .  .  .  1  1  1  .  .  .  .  .  .  .  .
%     .  .  .  .  .  .  .  .  .  .  .  1  2  1  .  .  .  .  .  .  .
%     .  .  .  .  .  .  .  .  .  .  .  .  1  3  1  .  .  .  .  .  .
%     .  .  .  .  .  .  .  .  .  .  .  .  .  1  4  1  .  .  .  .  .
%     .  .  .  .  .  .  .  .  .  .  .  .  .  .  1  5  1  .  .  .  .
%     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  1  6  1  .  .  .
%     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  1  7  1  .  .
%     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  1  8  1  .
%     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  1  9  1
%     .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  1 10
%
%  Properties:
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Wilkinson,
%    The Algebraic Eigenvalue Problem,
%    Oxford University Press, 1965,
%    page 308.
%
%  Parameters:
%
%    Input, integer N, the order of the desired matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = round ( abs ( i - ( n + 1 ) / 2.0 ) );
      elseif ( j == i + 1 )
        a(i,j) = 1;
      elseif ( j == i - 1 )
        a(i,j) = 1;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
