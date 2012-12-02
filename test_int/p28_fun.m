function fx = p28_fun ( n, x )

%*****************************************************************************80
%
%% P28_FUN evaluates the integrand for problem 28.
%
%  Interval:
%
%    0 <= x <= 2 pi
%
%  Integrand:
%
%    exp ( - x ) * sin ( 50 * x )
%
%  Exact Integral:
%
%    50 / ( 2501 ) * ( 1 - exp ( - 2 * pi ) )
%
%  Approximate Integral (20 digits):
%
%    0.019954669277654778312...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
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
  fx = exp ( - x ) .* sin ( 50.0 * x );

  return
end
