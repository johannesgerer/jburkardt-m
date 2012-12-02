function a = dif1 ( m, n )

%*****************************************************************************80
%
%% DIF1 returns the first difference matrix.
%
%  Discussion:
%
%    For a set of N points X(I) with equal spacing H, and a set of data
%    values Y(I) associated with those points, the product 
%    1/(2*H) * A * Y returns an approximation to the first derivative
%    of Y(X) at the interior points X(2:N-1).
%
%  Example:
%
%    N = 5
%
%    0 +1  .  .  .
%   -1  0 +1  .  .
%    . -1  0 +1  .
%    .  . -1  0 +1
%    .  .  . -1  0
%
%  Rectangular Properties:
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
%  Square Properties:
%
%    A is antisymmetric: A' = -A.
%
%    Because A is antisymmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    If N is even, then A is nonsingular.
%    If N is odd, then A is singular.
%
%    If N is even, det ( A ) = 1.0.
%    If N is odd, det ( A ) = 0.0.
%
%    If N is odd, a null vector is ( 1, 0, 1, 0, ..., 1, 0, 1 )..
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
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
  a(1:m,1:n) = 0.0;

  for i = 1 : m

    if ( 0 < i - 1 )
      a(i,i-1) = -1.0;
    end

    if ( i + 1 <= n )
      a(i,i+1) = +1.0;
    end

  end

  return
end
