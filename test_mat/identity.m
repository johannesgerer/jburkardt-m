function a = identity ( m, n )

%*****************************************************************************80
%
%% IDENTITY returns the IDENTITY matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 4, N = 5
%
%    1 0 0 0 0
%    0 1 0 0 0
%    0 0 1 0 0
%    0 0 0 1 0
%
%  Rectangular properties:
%
%    A is integral: int ( A ) = A.
%
%    A is a zero/one matrix.
%
%  Square Properties:
%
%    A is nonsingular.
%
%    A is involutional: A * A = I.
%
%    A is diagonal.
%
%    Because A is diagonal, it has property A.
%
%    A is symmetric: A' = A.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    LAMBDA(1:N) = 1
%
%    The matrix of eigenvectors of A is A.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    For any vector v, A*v = v.
%
%    For any matrix B, A*B = B*A=B.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
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
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of 
%    the matrix.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n
      if ( i == j )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
