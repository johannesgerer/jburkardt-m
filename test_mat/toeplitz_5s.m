function [ n, a ] = toeplitz_5s ( row_num, col_num, alpha, beta, gamma )

%*****************************************************************************80
%
%% TOEPLITZ_5S returns a symmetric matrix of order M*N with 5 constant diagonals.
%
%  Formula:
%
%    if ( J = I )
%      A(I,J) = ALPHA
%    elseif ( J = I + 1 or J = I - 1 )
%      A(I,J) = BETA
%    elseif ( J = I + COL_NUM or J = I - COL_NUM )
%      A(I,J) = GAMMA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ROW_NUM = 2, COL_NUM = 3, 
%    ALPHA = 6, BETA = 4, GAMMA = 2
%
%    6 4 0 | 2 0 0
%    4 6 4 | 0 2 0
%    0 4 6 | 0 0 2
%    ------+------
%    2 0 0 | 6 4 0
%    0 2 0 | 4 6 4
%    0 0 2 | 0 4 6
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is Toeplitz: constant along diagonals.
%
%    A has just 5 nonzero diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is "block tridiagonal".
%
%    A has eigenvalues
%
%      LAMBDA(I,J) = ALPHA + 2 * BETA  * COS(I*PI/(COL_NUM+1))
%                          + 2 * GAMMA * COS(J*PI/(ROW_NUM+1)), 
%      I = 1 to COL_NUM, J = 1 to ROW_NUM.
%
%    If ALPHA = -4, BETA = GAMMA = 1, the matrix is associated with 
%    approximations to the Laplacian operator on a rectangular 
%    ROW_NUM by COL_NUM grid of equally spaced points.  See routine POISSON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 10, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer ROW_NUM, the block order of A.
%
%    Input, integer COL_NUM, the order of the subblocks of A.
%
%    Input, real ALPHA, BETA, GAMMA, the scalars that define A.
%
%    Output, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  n = row_num * col_num;

  for i = 1 : n
    for j = 1 : n

      if ( j == i )
        a(i,j) = alpha;
      elseif ( j == i + 1 | j == i - 1 )
        a(i,j) = beta;
      elseif ( j == i + col_num | j == i - col_num )
        a(i,j) = gamma;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
