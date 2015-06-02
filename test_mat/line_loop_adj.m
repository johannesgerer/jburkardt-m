function a = line_loop_adj ( n )

%*****************************************************************************80
%
%% LINE_LOOP_ADJ returns the line loop adjacency matrix.
%
%  Example:
%
%    N = 5
%
%    1  1  0  0  0
%    1  1  1  0  0
%    0  1  1  1  0
%    0  0  1  1  1
%    0  0  0  1  1
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
%    A is a zero/one matrix.
%
%    The row and column sums are all 3, except for the first and last
%    rows and columns which have a sum of 2.
%
%    The family of matrices is nested as a function of N.
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
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      if ( j == i - 1 )
        a(i,j) = 1.0;
      elseif ( j == i )
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
