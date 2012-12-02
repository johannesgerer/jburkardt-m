function a = c8mat_house ( n, x )

%*****************************************************************************80
%
%% C8MAT_HOUSE constructs a complex Householder elementary reflector matrix.
%
%  Formula:
%
%     A = I - ( 2 * X * hermitian ( X ) ) / ( conjg ( X ) * X )
%
%  Example:
%
%    N = 5, X = ( 1, 1, 1, 0, -1 )
%
%   1/2 -1/2 -1/2  0  1/2
%  -1/2  1/2 -1/2  0  1/2
%  -1/2 -1/2  1/2  0  1/2
%    0    0    0   1   0
%   1/2  1/2  1/2  0  1/2
%
%  Properties:
%
%    A is hermitian: hermitian ( A ) = A.
%
%    Because A is hermitian, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is unitary: hermitian ( A ) * A = A * hermitian ( A ) = I.
%
%    inverse ( A ) = A.
%
%    det ( A ) = -1.
%
%    LAMBDA(1) = -1.
%
%    If X is the vector used to define A, then X is an eigenvector
%    of A associated with the eigenvalue of -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, complex X(N), the vector that defines the
%    Householder matrix.
%
%    Output, complex A(N,N), the matrix.
%
  a = c8mat_identity ( n );

  xdot = real ( x(1:n) * x(1:n)' );

  if ( 0.0 < xdot )

    for i = 1 : n
      for j = 1 : n
        a(i,j) = a(i,j) - 2.0 * x(i) * x(j)' / xdot;
      end
    end

  end

  return
end
