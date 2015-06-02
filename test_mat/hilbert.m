function a = hilbert ( m, n )

%*****************************************************************************80
%
%% HILBERT returns the HILBERT matrix.
%
%  Formula:
%
%    A(I,J) = 1 / ( I + J - 1 )
%
%  Example:
%
%    N = 5
%
%    1/1 1/2 1/3 1/4 1/5
%    1/2 1/3 1/4 1/5 1/6
%    1/3 1/4 1/5 1/6 1/7
%    1/4 1/5 1/6 1/7 1/8
%    1/5 1/6 1/7 1/8 1/9
%
%  Rectangular Properties:
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%  Square Properties:
%
%    A is positive definite.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is totally positive.
%
%    A is a Cauchy matrix.
%
%    A is nonsingular.
%
%    A is very ill-conditioned.
%
%    The entries of the inverse of A are all integers.
%
%    The sum of the entries of the inverse of A is N*N.
%
%    The ratio of the absolute values of the maximum and minimum
%    eigenvalues is roughly EXP(3.5*N).
%
%    The determinant of the Hilbert matrix of order 10 is
%    2.16417... * 10^(-53).
%
%    If the (1,1) entry of the 5 by 5 Hilbert matrix is changed
%    from 1 to 24/25, the matrix is exactly singular.  And there
%    is a similar rule for larger Hilbert matrices.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    MD Choi,
%    Tricks or treats with the Hilbert matrix,
%    American Mathematical Monthly,
%    Volume 90, 1983, pages 301-312.
%
%    Robert Gregory, David Karney,
%    Example 3.8,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 33,
%    LC: QA263.G68.
%
%    Nicholas Higham,
%    Accuracy and Stability of Numerical Algorithms,
%    Society for Industrial and Applied Mathematics, Philadelphia, PA,
%    USA, 1996; section 26.1.
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms, Second Edition
%    Addison-Wesley, Reading, Massachusetts, 1973, page 37.
%
%    Morris Newman and John Todd,
%    Example A13,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, 1958, pages 466-476.
%
%    Joan Westlake,
%    Test Matrix A12,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = 1.0 / ( i + j - 1 );
    end
  end

  return
end
