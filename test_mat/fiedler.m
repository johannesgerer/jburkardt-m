function a = fiedler ( m, n, x )

%*****************************************************************************80
%
%% FIEDLER returns the FIEDLER matrix.
%
%  Formula:
%
%    A(I,J) = abs ( X(I) - X(J) )
%
%  Example:
%
%    M = 5, N = 5, X = ( 1, 2, 3, 5, 9 )
%
%    0  1  2  4  8
%    1  0  1  3  7
%    2  1  0  2  6
%    4  3  2  0  4
%    8  7  6  4  0
%
%  Rectangular Properties:
%
%    A has a zero diagonal.
%
%  Square Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    det ( A ) = (-1)^N * 2^(N-2)
%      * ( X(1) - X(N) ) * product ( 2 <= I <= N ) ( X(I) - X(I-1) ).
%
%    A is nonsingular if the X(I) are distinct.
%
%    The inverse is cyclic tridiagonal; that is, it is tridiagonal, except
%    for nonzero (1,N) and (N,1) entries.
%
%    A has a dominant positive eigenvalue, and all others are negative.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gabor Szego,
%    Solution to problem 3705,
%    American Mathematical Monthly,
%    Volume 43, Number 4, 1936, pages 246-259.
%
%    John Todd,
%    Example A14,
%    Basic Numerical Mathematics,
%    Volume 2: Numerical Algebra,
%    Academic Press, 1977, page 159.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real X( max (M,N) ), the values that define A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = abs ( x(i) - x(j) );
    end
  end

  return
end
