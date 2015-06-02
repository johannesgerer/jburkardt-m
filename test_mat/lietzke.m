function a = lietzke ( n )

%*****************************************************************************80
%
%% LIETZKE returns the LIETZKE matrix.
%
%  Formula:
%
%    A(I,J) = N - abs ( I - J )
%
%  Example:
%
%    N = 5
%
%     5  4  3  2  1
%     4  5  4  3  2
%     3  4  5  4  3
%     2  3  4  5  4
%     1  2  3  4  5
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
%  Reference:
%
%    M Lietzke, R Stoughton, Marjorie Lietzke,
%    A Comparison of Several Methods for Inverting Large Symmetric
%    Positive Definite Matrices,
%    Mathematics of Computation,
%    Volume 18, Number 87, pages 449-456.
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = ( n - abs ( i - j ) );
    end
  end

  return
end
