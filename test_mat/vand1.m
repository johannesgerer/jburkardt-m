function a = vand1 ( n, x )

%*****************************************************************************80
%
%% VAND1 returns the VAND1 matrix.
%
%  Formula:
%
%    A(I,J) = X(J)^(I-1)
%
%  Example:
%
%    N = 5, X = ( 2, 3, 4, 5, 6 )
%
%    1  1   1   1   1
%    2  3   4   5   6
%    4  9  16  25  36
%    8 27  64 125  216
%   16 81 256 625 1296
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular if, and only if, the X values are distinct.
%
%    det ( A ) = product ( 1 <= I <= N ) ( 1 <= J < I ) ( X(I) - X(J) ).
%             = product ( 1 <= J <= N ) X(J)
%             * product ( 1 <= I < J ) ( X(J) - X(I) ).
%
%    A is generally ill-conditioned.
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
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 27,
%    LC: QA263.G68.
%
%    Nicholas Higham,
%    Stability analysis of algorithms for solving confluent
%    Vandermonde-like systems,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 11, 1990, pages 23-41.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix desired.
%
%    Input, real X(N), the values that define A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == 1 & x(j) == 0.0 )
        a(i,j) = 1.0;
      else
        a(i,j) = x(j)^(i-1);
      end

    end
  end

  return
end
