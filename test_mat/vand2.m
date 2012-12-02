function a = vand2 ( n, x )

%*****************************************************************************80
%
%% VAND2 returns the Vandermonde2 matrix.
%
%  Formula:
%
%    A(I,J) = X(I)**(J-1)
%
%  Example:
%
%    N = 5, X = (2, 3, 4, 5, 6)
%
%    1 2  4   8   16
%    1 3  9  27   81
%    1 4 16  64  256
%    1 5 25 125  625
%    1 6 36 216 1296
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular if, and only if, the X values are distinct.
%
%    det ( A ) = product ( 1 <= I <= N ) (
%      product ( 1 <= J < I ) ( ( X(I) - X(J) ) ) ).
%
%    det ( A ) = product ( 1 <= I <= N ) (
%        X(I) * product ( 1 <= J <= I - 1 ) ( ( X(I) - X(J) ) ).
%
%    A is generally ill-conditioned.
%
%    The sum of the entries of A is
%
%      1 - product ( 1 <= I <= N ) ( 1 - 1 / X(I) ).
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
  for i = 1 : n
    for j = 1 : n

      if ( j == 1 & x(i) == 0.0 )
        a(i,j) = 1.0;
      else
        a(i,j) = x(i)^(j-1);
      end

    end
  end

  return
end
