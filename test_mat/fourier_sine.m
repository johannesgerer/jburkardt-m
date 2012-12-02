function a = fourier_sine ( n )

%*****************************************************************************80
%
%% FOURIER_SINE returns the discrete Fourier Sine Transform matrix.
%
%  Discussion:
%
%    This matrix is occasionally known as the "Newman" matrix.
%
%  Formula:
%
%    A(I,J) = sqrt ( 2 / (N+1) ) * SIN ( I * J * PI / (N+1) )
%
%  Example:
%
%    N = 5
%
%     0.288675     0.5    0.577350    0.5    0.288675
%     0.5          0.5    0.0        -0.5   -0.5
%     0.577350     0.0   -0.577350    0.0    0.577350
%     0.5         -0.5    0.0         0.5   -0.5
%     0.288675    -0.5    0.577350   -0.5    0.288675
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is orthogonal: A' * A = A * A' = I.
%
%    A is involutional: A * A = I.
%
%    A is generally not positive definite.
%
%    All eigenvalues of A have absolute value 1.
%
%    A is the eigenvector matrix of the second difference matrix (-1,2,-1).
%
%    A can be used to compute the Discrete Fourier Sine Transform of
%    a set of data X,
%       DFST ( X ) = A * X
%    A second multiplication by A recovers the original data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.11,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 41, 
%    LC: QA263.G68.
%
%    Nicholas Higham, Desmond Higham,
%    Large growth factors in Gaussian elimination with pivoting,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 10, 1989, pages 155-164.
%
%    Joan Westlake,
%    Test Matrix A7,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      angle = ( i * j ) * pi / ( n + 1 );
      a(i,j) = sin ( angle );
    end
  end

  a(1:n,1:n) = a(1:n,1:n) * sqrt ( 2.0 / ( n + 1 ) );

  return
end
