function a = indicator ( m, n )

%*****************************************************************************80
%
%% INDICATOR sets the indicator matrix.
%
%  Discussion:
%
%    The indicator matrix has entries which reveal their row and column.
%
%    That makes it useful for testing printing algorithms, or schemes
%    which select a submatrix, or extract a particular value from a
%    matrix, or in general, any situation in which it would be useful
%    to know the origin of a value that was extracted from a matrix.
%
%  Example:
%
%    M = 3, N = 4
%
%    A =
%
%    11 12 13 14
%    21 22 23 24
%    31 32 33 34
%
%  Properties:
%
%    For a particular A, no two entries are equal.
%
%    A is generally not symmetric: A' /= A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns 
%    of the matrix A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  k = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = i * k + j;
    end
  end

  return
end
