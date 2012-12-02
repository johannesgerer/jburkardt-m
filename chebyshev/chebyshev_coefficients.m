function c = chebyshev_coefficients ( a, b, n, f )

%*****************************************************************************80
%
%% CHEBYSHEV_COEFFICIENTS determines Chebyshev interpolation coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2011
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
%    Input, real F ( X ), a function handle.
%
%    Output, real C(N), the Chebyshev coefficients.
%
  angle = ( 1 : 2 : ( 2 * n - 1 ) ) * pi / ( 2 * n );
  angle = angle';
  x = cos ( angle );
  x = 0.5 * ( a + b ) + x * 0.5 * ( b - a );
  fx = f ( x );

  c = zeros ( n, 1 );
  for j = 1 : n
    c(j) = 0.0;
    for k = 1 : n
      c(j) = c(j) + fx(k) * cos ( pi * ( j - 1 ) * ( 2 * k - 1 ) / 2 / n );
    end
  end

  c(1:n) = 2.0 * c(1:n) / n;

  return
end
