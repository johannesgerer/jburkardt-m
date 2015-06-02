function a = moler3 ( m, n )

%*****************************************************************************80
%
%% MOLER3 returns the MOLER3 matrix.
%
%  Formula:
%
%    if ( I == J )
%      A(I,J) = I
%    else
%      A(I,J) = min(I,J) - 2
%
%  Example:
%
%    N = 5
%
%     1 -1 -1 -1 -1
%    -1  2  0  0  0
%    -1  0  3  1  1
%    -1  0  1  4  2
%    -1  0  1  2  5
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is positive definite.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A has a simple Cholesky factorization.
%
%    A has one small eigenvalue.
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
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      if ( i == j )
        a(i,j) = i;
      else
        a(i,j) = min ( i, j ) - 2;
      end
    end
  end

  return
end
