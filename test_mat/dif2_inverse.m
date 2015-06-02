function a = dif2_inverse ( n )

%*****************************************************************************80
%
%% DIF2_INVERSE returns the inverse of the DIF2 matrix.
%
%  Formula:
%
%    if ( I <= J )
%      A(I,J) = I * (N-J+1) / (N+1)
%    else
%      A(I,J) = J * (N-I+1) / (N+1)
%
%  Example:
%
%    N = 4
%
%            4 3 2 1
%    (1/5) * 3 6 4 2
%            2 4 6 3
%            1 2 3 4
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    det ( A ) = 1 / ( N + 1 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      if ( i <= j )
        a(i,j) = ( i * ( n - j + 1 ) ) / ( n + 1 );
      else
        a(i,j) = ( j * ( n - i + 1 ) ) / ( n + 1 );
      end
    end
  end

  return
end
