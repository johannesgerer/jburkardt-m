function a = jacobi ( m, n )

%*****************************************************************************80
%
%% JACOBI returns the Jacobi matrix.
%
%  Formula:
%
%    if ( J = I - 1 )
%      A(I,J) = 0.5 * sqrt ( ( 4 * J**2 ) / ( 4 * J**2 - 1 ) )
%    else if ( J = I + 1 )
%      A(I,J) = 0.5 * sqrt ( ( 4 * (J-1)**2 ) / ( 4 * (J-1)**2 - 1 ) )
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 4, N = 4
%
%    0            0.577350269  0            0
%    0.577350269  0            0.516397779  0
%    0            0.516397779  0            0.507092553
%    0            0            0.507092553  0
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A has a zero diagonal.
%
%    The eigenvalues of A are the zeros of the Legendre polynomial
%    of degree N.  They lie symmetrically in [-1,1], and are also
%    the nodes of Gauss-Legendre quadrature.  For the case of N = 4,
%    these eigenvalues are
%
%      [ -0.861136312, -0.339981044, +0.339981044, +0.861136312 ].
%
%    It follows that A is singular when N is odd.
%
%    The J-th Gauss-Legendre weight is twice the square of the first
%    component of the J-th eigenvector of A.  For the case of N = 4,
%    the eigenvector matrix is:
%
%      -0.417046     -0.571028     -0.571028    0.417046
%       0.622037      0.336258     -0.336258    0.622038
%      -0.571028      0.417046      0.417046    0.571028
%       0.336258     -0.622037      0.622038    0.336258
%
%    and the corresponding weights are
%
%      [ 0.347854845, 0.652145155, 0.652145155, 0.347854845 ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Lloyd Trefethen, David Bau,
%    Numerical Linear Algebra,
%    SIAM, 1997, pages 287-292.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( j == i - 1 )
        a(i,j) = 0.5 * sqrt ( ( 4 * j * j ) / ( 4 * j * j - 1 ) );
      elseif ( j == i + 1 )
        a(i,j) = 0.5 * sqrt ( ( 4 * ( j - 1 ) * ( j - 1 ) ) ...
          / ( 4 * ( j - 1 ) * ( j - 1 ) - 1 ) );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
