function a = maxij ( m, n )

%*****************************************************************************80
%
%% MAXIJ returns the MAXIJ matrix.
%
%  Discussion:
%
%    This matrix is occasionally known as the "Boothroyd MAX" matrix.
%
%  Formula:
%
%    A(I,J) = max(I,J)
%
%  Example:
%
%    N = 5
%
%    1 2 3 4 5
%    2 2 3 4 5
%    3 3 3 4 5
%    4 4 4 4 5
%    5 5 5 5 5
%
%  Properties:
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
%    The inverse of A is tridiagonal.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.13,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 42,
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
      a(i,j) = max ( i, j );
    end
  end

  return
end
