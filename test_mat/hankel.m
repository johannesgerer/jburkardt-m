function a = hankel ( n, x )

%*****************************************************************************80
%
%% HANKEL returns the Hankel matrix defined by X.
%
%  Formula:
%
%    A(I,J) = X(I+J-1)
%
%  Example:
%
%    N = 5, X = ( 1, 2, 3, 4, 5, 6, 7, 8, 9 )
%
%    1  2  3  4  5
%    2  3  4  5  6
%    3  4  5  6  7
%    4  5  6  7  8
%    5  6  7  8  9
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(2*N-1), the vector that defines A.
%
%    Output, real A(N,N), the matrix.
%
  for j = 1 : n
    a(1:n,j) = x(j:j+n-1);
  end

  return
end
