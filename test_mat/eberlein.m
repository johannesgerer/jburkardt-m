function a = eberlein ( alpha, n )

%*****************************************************************************80
%
%% EBERLEIN returns the Eberlein matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = - ( 2 * I - 1 ) * ( N - 1 ) - ( I - 1 ) * ALPHA + 2 * ( I - 1 )**2
%    else if ( J = I+1 )
%      A(I,J) = I * ( N + ALPHA - I )
%    else if ( J = I-1 )
%      A(I,J) = ( I - 1 ) * ( N - I + 1 )
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5, ALPHA = 2
%
%    -4   6   0   0   0
%     4 -12  10   0   0
%     0   6 -16  12   0
%     0   0   6 -16  12
%     0   0   0   4 -12
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    The matrix is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    The sum of the entries in any row except the last one is ALPHA.
%
%    The sum of the entries in the last row is -(N-1)*ALPHA.
%
%    The sum of the entries in any column is zero.
%
%    A is singular.
%
%    det ( A ) = 0
%
%    A has the LEFT null vector ( 1, 1, ..., 1 ).
%
%    LAMBDA(I) = - ( I - 1 ) * ( ALPHA + I ).
%
%    Left eigenvectors are
%
%      V^J(I) = 1/COMB(N-1,I-1) * sum ( 0 <= K <= min ( I, J ) ) [ (-1)**K *
%        COMB(N-1-K,N-I) * COMB(J-1,K) * COMB(ALPHA+J-1+K, K )
%
%    For ALPHA = -2, ..., -2*(N-1), the matrix is defective with two or more
%    pairs of eigenvectors coalescing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Patricia Eberlein,
%    A Two-Parameter Test Matrix,
%    Mathematics of Computation,
%    Volume 18, 1964, pages 296-298.
%
%    Joan Westlake,
%    Test Matrix A41,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i )

        a(i,j) = - ( ( 2 * i - 1 ) * ( n - 1 )  +  ( i - 1 ) * alpha ...
          - 2 * ( i - 1 ) * ( i - 1 ) );

      elseif ( j == i+1 )

        a(i,j) = i * ( n - i + alpha );

      elseif ( j == i-1 )

        a(i,j) = ( i - 1 ) * ( n - i + 1 );

      else

        a(i,j) = 0.0;

      end

    end
  end

  return
end
