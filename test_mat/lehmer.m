function a = lehmer ( m, n )

%*****************************************************************************80
%
%% LEHMER returns the Lehmer matrix.
%
%  Discussion:
%
%    This matrix is also known as the "Westlake" matrix.
%
%  Formula:
%
%    A(I,J) = min ( I, J ) / max ( I, J )
%
%  Example:
%
%    N = 5
%
%    1/1  1/2  1/3  1/4  1/5
%    1/2  2/2  2/3  2/4  2/5
%    1/3  2/3  3/3  3/4  3/5
%    1/4  2/4  3/4  4/4  4/5
%    1/5  2/5  3/5  4/5  5/5
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is positive definite.
%
%    A is totally nonnegative.
%
%    The inverse of A is tridiagonal.
%
%    The condition number of A lies between N and 4*N*N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Morris Newman, John Todd,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, Number 4, 1958, pages 466-476.
%
%    Solutions to problem E710, proposed by DH Lehmer: The inverse of
%    a matrix.
%    American Mathematical Monthly,
%    Volume 53, Number 9, November 1946, pages 534-535.
%
%    John Todd,
%    Basic Numerical Mathematics, Volume 2: Numerical Algebra,
%    Academic Press, 1977, page 154.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      a(i,j) = ( min ( i, j ) ) / ( max ( i, j ) );
    end
  end

  return
end
