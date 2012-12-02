function a = gk323 ( m, n )

%*****************************************************************************80
%
%% GK323 returns a Gregory and Karney test matrix.
%
%  Discussion:
%
%    This matrix is occasionally known as the "Todd" matrix.
%
%  Formula:
%
%    A(I,J) = abs ( I - J )
%
%  Example:
%
%    N = 5
%
%     0  1  2  3  4
%     1  0  1  2  3
%     2  1  0  1  2
%     3  2  1  0  1
%     4  3  2  1  0
%
%  Rectangular Properties:
%
%    A is integral: int ( A ) = A.
%
%    A is a special case of the Fiedler matrix.
%
%  Square Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    det ( A ) = (-1)**(N-1) * 2**(N-2) * ( N - 1 ).
%
%    A has a dominant positive eigenvalue, and N-1 real negative eigenvalues.
%
%    If N = 2 mod 4, then -1 is an eigenvalue, with an eigenvector
%    of the form ( 1, -1, -1, 1, 1, -1, -1, 1, ... ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.23,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 51, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      a(i,j) = abs ( i - j );
    end
  end

  return
end
