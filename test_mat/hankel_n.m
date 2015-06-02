function a = hankel_n ( n )

%*****************************************************************************80
%
%% HANKEL_N returns the HANKEL_N matrix.
%
%  Formula:
%
%    A(I,J) = I+J-1 for I+J-1 <= N + 1
%           = 0     otherwise 
%
%  Example:
%
%    N = 5
%
%    1  2  3  4  5
%    2  3  4  5  0
%    3  4  5  0  0
%    4  5  0  0  0
%    5  0  0  0  0
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
%    determinant ( A ) = (-1)^(N/2) * N^N
%
%   The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for j = 1 : n
    for i = 1 : n + 1 - j
      a(i,j) = i + j - 1;
    end
    for i = n + 2 - j : n
      a(i,j) = 0.0;
    end
  end

  return
end
