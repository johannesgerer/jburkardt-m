function fx = p25_fun ( n, x )

%*****************************************************************************80
%
%% P25_FUN evaluates the integrand for problem 25.
%
%  Interval:
%
%    0 <= x <= 1.
%
%  Integrand:
%
%    ln ( abs ( x - 0.7 ) )
%
%  Exact Integral:
%
%    0.3 * ln ( 0.3 ) + 0.7 * ln ( 0.7 ) - 1
%
%  Approximate Integral (20 digits):
%
%    -1.6108643020548934630
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kendall Atkinson,
%    An Introduction to Numerical Analysis,
%    Prentice Hall, 1984, page 303.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = log ( abs ( x - 0.7 ) );

  return
end
