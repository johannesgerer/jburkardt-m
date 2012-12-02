function a = kms_inverse ( alpha, n )

%*****************************************************************************80
%
%% KMS_INVERSE returns the inverse of the Kac-Murdock-Szego matrix.
%
%  Formula:
%
%    if ( I = J )
%      if ( I = 1 )
%        A(I,J) = -1/(ALPHA**2-1)
%      elseif ( I < N )
%        A(I,J) = -(ALPHA**2+1)/(ALPHA**2-1)
%      elseif ( I = N )
%        A(I,J) = -1/(ALPHA**2-1)
%    elseif ( J = I + 1 or I = J + 1 )
%      A(I,J) = ALPHA/(ALPHA**2-1)
%    else
%      A(I,J) = 0 otherwise
%
%  Example:
%
%    ALPHA = 2, N = 5
%
%         -1  2  0  0  0
%          2 -5  2  0  0
%    1/3 * 0  2 -5  2  0
%          0  0  2 -5  2
%          0  0  0  2 -1
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
%    William Trench,
%    Numerical solution of the eigenvalue problem for Hermitian
%    Toeplitz matrices,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 10, Number 2, April 1989, pages 135-146.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  bot = alpha * alpha - 1.0;

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        if ( j == 1 )
          a(i,j) = - 1.0 / bot;
        elseif ( j < n )
          a(i,j) = - ( alpha * alpha + 1.0 ) / bot;
        elseif ( j == n )
          a(i,j) = -1.0 / bot;
        end
      elseif ( i == j + 1 | j == i + 1 )
        a(i,j) = alpha / bot;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
