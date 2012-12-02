function a = cheby_van1 ( n, x )

%*****************************************************************************80
%
%% CHEBY_VAN1 returns the Chebyshev Vandermonde-like matrix.
%
%  Formula:
%
%    if ( I = 1 ) then
%      A(1,J) = 1
%    else if ( I = 2 ) then
%      A(2,J) = X(J)
%    else
%      A(I,J) = 2.0D+00 * X(J) * A(I-1,J) - A(I-2,J)
%
%  Example:
%
%    N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1  1   1    1    1
%    1  2   3    4    5
%    1  7  17   31   49
%    1 26  99  244  485
%    1 97 577 1921 4801
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A(I,J) = T(I-1) ( X(J) ) where T(I-1) is a Chebyshev polynomial.
%
%    A will be singular if the X values are not distinct.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2008
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
%    Input, integer N, the order of A.
%
%    Input, real X(N), the vector that defines A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )
        a(i,j) = 1.0;
      elseif ( i == 2 )
        a(i,j) = x(j);
      else
        a(i,j) = 2.0 * x(j) * a(i-1,j) - a(i-2,j);
      end

    end
  end

  return
end
