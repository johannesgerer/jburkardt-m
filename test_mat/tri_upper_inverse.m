function a = tri_upper_inverse ( alpha, n )

%*****************************************************************************80
%
%% TRI_UPPER_INVERSE returns the inverse of the TRI_UPPER matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 1
%    elseif ( I = J - 1 )
%      A(I,J) = -ALPHA
%    elseif ( I < J )
%      A(I,J) = - ALPHA * ( 1-ALPHA)^(J-I-1)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 3, N = 5
%
%    1 -3  6 -12  24
%    0  1 -3   6 -12
%    0  0  1  -3   6
%    0  0  0   1  -3
%    0  0  0   0   1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular.
%
%    A is upper triangular.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2007
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
      elseif ( i == j - 1 )
        a(i,j) = - alpha;
      elseif ( i < j )
        a(i,j) = - alpha * ( 1.0 - alpha )^(j-i-1);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
