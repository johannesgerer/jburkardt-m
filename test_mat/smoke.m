function a = smoke ( n )

%*****************************************************************************80
%
%% SMOKE returns the SMOKE matrix.
%
%  Formula:
%
%    W = exp ( 2 * PI * sqrt ( -1 ) / N )
%
%    If ( J = I + 1 )
%      A(I,J) = 1
%    If ( I = N and J = 1 )
%      A(I,J) = 1
%    If ( I = J )
%      A(I,J) = W**I
%    Else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%    w  1    0    0    0
%    0  w**2 1    0    0
%    0  0    w**3 1    0
%    0  0    0    w**4 1
%    1  0    0    0    w**5
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    The matrix has an interesting spectrum.  The eigenvalues are
%    the N-th roots of unity times 2**(1/N).
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
%  Reference:
%
%    Lothar Reichel, Lloyd Trefethen,
%    Eigenvalues and pseudo-eigenvalues of Toeplitz matrices,
%    Linear Algebra and Applications,
%    Volume 162-164, 1992, pages 153-185.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex A(N,N), the smoke matrix.
%
  angle = 2.0 * pi / n;
  w = complex ( cos ( angle ), sin ( angle ) );

  for i = 1 : n
    for j = 1 : n
      if ( j + 1 == i )
        a(i,j) = 1.0;
      elseif ( i == n & j == 1 )
        a(i,j) = 1.0;
      elseif ( i == j )
        a(i,j) = w^i;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
