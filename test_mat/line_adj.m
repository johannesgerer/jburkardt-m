function a = line_adj ( n )

%*****************************************************************************80
%
%% LINE_ADJ returns the line adjacency matrix.
%
%  Example:
%
%    N = 5
%
%    0  1  0  0  0
%    1  0  1  0  0
%    0  1  0  1  0
%    0  0  1  0  1
%    0  0  0  1  0
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
%    A is an adjacency matrix for a set of points arranged in a line.
%
%    A has a zero diagonal.
%
%    A is a zero/one matrix.
%
%    The row and column sums are all 2, except for the first and last
%    rows and columns which have a sum of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( j == i - 1 )
        a(i,j) = 1.0;
      elseif ( j == i + 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
