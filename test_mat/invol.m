function a = invol ( n )

%*****************************************************************************80
%
%% INVOL returns the INVOL matrix.
%
%  Formula:
%
%    A(I,J) = 1 / ( I + J - 1 )
%
%    Set D = -N
%
%    Multiply column 1 of A by D.
%
%    For I = 1 to N-1
%      D = -(N+I)*(N-I)*D/(I*I)
%      Multiply row I + 1 by D.
%    End
%
%  Example:
%
%    N = 5
%
%       -5     0.5     0.33     0.25    0.2
%     -300    40.0    30.00    24.00   20.0
%     1050  -157.5  -126.00  -105.00  -90.0
%    -1400   224.0   186.66   160.00  140.0
%      630  -105.0   -90.00   -78.75  -70.0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is involutional: A * A = I.
%
%    det ( A ) = +1 or -1.
%
%    A is unimodular.
%
%    The matrices:
%      B = 1/2 ( I - A )
%    and
%      C = 1/2 ( I + A )
%    are idempotent, that is, B * B = B, and C * C = C.
%
%    A is ill-conditioned.
%
%    A is a diagonally scaled version of the Hilbert matrix.
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
%  Reference:
%
%    Alston Householder, John Carpenter,
%    The singular values of involutory and of idempotent matrices,
%    Numerische Mathematik,
%    Volume 5, 1963, pages 234-237.
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
      a(i,j) = 1.0 / ( i + j - 1 );
    end
  end

  a(1:n,1) = - n * a(1:n,1);

  d = - n;
  for i = 1 : n-1
    d = - ( n + i ) * ( n - i ) * d  / ( i * i );
    a(i+1,1:n) = d * a(i+1,1:n);
  end

  return
end
