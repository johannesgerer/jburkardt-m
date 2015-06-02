function a = spline ( n, x )

%*****************************************************************************80
%
%% SPLINE returns the SPLINE matrix.
%
%  Discussion:
%
%    This matrix arises during interpolation with cubic splines.
%
%  Formula:
%
%    if ( I = 1 and J = I )
%      A(I,J) = 2 * X(I)
%    elseif ( I = 1 and J = I + 1 )
%      A(I,J) = X(I)
%    elseif ( I = N and J = I )
%      A(I,J) = 2 * X(N-1)
%    elseif ( I = N and J = I - 1 )
%      A(I,J) = X(N-1)
%    elseif ( J = I )
%      A(I,J) = 2 * (X(I-1)+X(I))
%    elseif ( J = I-1 )
%      A(I,J) = X(I-1)
%    elseif ( J = I + 1 )
%      A(I,J) = X(I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%    X = ( 1, 1, 1, 1 )
%
%    2   1   0   0  0
%    1   4   1   0  0
%    0   1   4   1  0
%    0   0   1   4  1
%    0   0   0   1  2
%
%    N = 5
%    X = ( 1, 2, 3, 4 )
%
%    2   1   0   0  0
%    1   6   2   0  0
%    0   2  10   3  0
%    0   0   3  14  4
%    0   0   0   4  8
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    If the entries of X are positive, then A is positive definite.
%
%    If the entries of X are all of one sign, then A is diagonally dominant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N-1), values that represent the spacing 
%    between points, and which define the entries of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == 1 & j == i )
        a(i,j) = 2.0 * x(1);
      elseif ( i == 1 & j == i + 1 )
        a(i,j) = x(1);
      elseif ( i == n & j == i     )
        a(i,j) = 2.0 * x(n-1);
      elseif ( i == n & j == i - 1 )
        a(i,j) = x(n-1);
      elseif ( j == i )
        a(i,j) = 2.0 * ( x(i-1) + x(i) );
      elseif ( j == i - 1 )
        a(i,j) = x(i-1);
      elseif ( j == i + 1 )
        a(i,j) = x(i);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
