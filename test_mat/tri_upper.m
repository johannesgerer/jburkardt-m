function a = tri_upper ( alpha, n )

%*****************************************************************************80
%
%% TRI_UPPER returns the TRI_UPPER matrix.
%
%  Discussion:
%
%    This matrix is known as the Wilkinson upper triangular matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1
%    if ( I < J )
%      A(I,J) = ALPHA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 3, N = 5
%
%    1 3 3 3 3
%    0 1 3 3 3
%    0 0 1 3 3
%    0 0 0 1 3
%    0 0 0 0 1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular.
%
%    A is upper triangular.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    The family of matrices is nested as a function of N.
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
%    Input, real ALPHA, value used on the superdiagonals.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = 1.0;
      elseif ( i < j )
        a(i,j) = alpha;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
