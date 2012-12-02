function a = summation ( m, n )

%*****************************************************************************80
%
%% SUMMATION returns the summation matrix.
%
%  Example:
%
%    M = 5, N = 5
%
%    1  0  0  0  0
%    1  1  0  0  0
%    1  1  1  0  0
%    1  1  1  1  0
%    1  1  1  1  1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is lower triangular.
%
%    A is a 0/1 matrix.
%
%    The vector Y = A * X contains the partial sums of the vector X.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is nonsingular.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( j <= i )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
