function value = chebyshev_interpolant ( a, b, n, c, m, x )

%*****************************************************************************80
%
%% CHEBYSHEV_INTERPOLANT evaluates a Chebyshev interpolant.
%
%  Discussion:
%
%    For n = 0, ..., define T(n,x) = cos ( n * arccos ( x ) ).
%
%    The polynomial T(n,x) has n zeros in [-1,+1].
%
%    For a given value n, the zeros of T(n,x) are
%
%      x(j,n) = cos ( pi * ( 2 * j - 1 ) / ( 2 * n ) ), for j = 1 to n.
%
%    For a given n, define the Chebyshev coefficients by
%
%      c(i) = (2/n) * sum ( 0 <= j < n ) f(x(j,n)) * T(i-1,x(j,n))
%
%    Now define the Chebyshev interpolant C(f) by:
%
%      C(f)(x) = sum ( 1 <= i <= n ) c(i) T(i-1,x) - 0.5 * c(1)
%
%    Then it is the case that
%
%      C(f)(x(j,n)) = f(x(j,n)) for j = 1 to n.
%
%    This function accepts the Chebyshev coefficients c(), and evaluates
%    the Chebyshev interpolant C(f)(x).
%      
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Roger Broucke,
%    Algorithm 446:
%    Ten Subroutines for the Manipulation of Chebyshev Series,
%    Communications of the ACM,
%    Volume 16, Number 4, April 1973, pages 254-256.
%
%    William Press, Brian Flannery, Saul Teukolsky, William Vetterling,
%    Numerical Recipes in FORTRAN: The Art of Scientific Computing,
%    Second Edition,
%    Cambridge University Press, 1992,
%    ISBN: 0-521-43064-X,
%    LC: QA297.N866.
%
%  Parameters:
%
%    Input, real A, B, the domain of definition.
%
%    Input, integer N, the order of the interpolant.
%
%    Input, real C(N), the Chebyshev coefficients.
%
%    Input, integer M, the number of points.
%
%    Input, real X(M), the points at which the polynomial is
%    to be evaluated.
%
%    Output, real CHEBYSHEV_INTERPOLANT(M), the value of the Chebyshev
%    interpolant at X.
%
  x = x(:);

  dip1 = zeros ( m, 1 );
  di = zeros ( m, 1 );
  y = ( 2.0 * x - a - b ) / ( b - a );

  for i = n : -1 : 2
    dip2 = dip1;
    dip1 = di;
    di = 2.0 * y .* dip1 - dip2 + c(i);
  end

  value = y .* di - dip1 + 0.5 * c(1);

  return
end
