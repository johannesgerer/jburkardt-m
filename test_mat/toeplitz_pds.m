function a = toeplitz_pds ( m, n, x, y )

%*****************************************************************************80
%
%% TOEPLITZ_PDS returns the TOEPLITZ_PDS matrix.
%
%  Discussion:
%
%    TOEPLITZ is a Toeplitz matrix that is positive definite symmetric.
%
%  Formula:
%
%    A(I,J) = sum ( 1 <= K <= M ) Y(K) * cos ( 2 * PI * X(K) * (I-J) )
%
%  Example:
%
%    N = 5, M = 5, 
%    X = ( -0.0625, - 0.03125, 0.0, 0.03125, 0.0625 ),
%    Y = ( 0.2, 0.2, 0.2, 0.2, 0.2)
%
%    1.000000  0.961866  0.852395  0.685661  0.482843
%    0.961866  1.000000  0.961866  0.852395  0.685661
%    0.852395  0.961866  1.000000  0.961866  0.852395
%    0.685661  0.852395  0.961866  1.000000  0.961866
%    0.482843  0.685661  0.852395  0.961866  1.000000
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
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is positive definite or positive semi-definite, depending on
%    the values of X.
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
%    George Cybenko, Charles Van Loan,
%    Computing the minimum eigenvalue of a symmetric positive definite
%    Toeplitz matrix,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 7, 1986, pages 123-131.
%
%  Parameters:
%
%    Input, integer M, the number of terms of W and X.
%
%    Input, integer N, the order of A.
%
%    Input, real X(M), used to define the matrix.
%
%    Input, real Y(M), a set of positive weights used to define the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = 0.0;
      for k = 1 : m
        angle = 2.0 * pi * x(k) * ( i - j );
        a(i,j) = a(i,j) + y(k) * cos ( angle );
      end
    end
  end

  return
end
