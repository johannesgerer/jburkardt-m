function fx = p26_fun ( n, x )

%*****************************************************************************80
%
%% P26_FUN evaluates the integrand for problem 26.
%
%  Interval:
%
%    0 <= x <= 2 pi
%
%  Integrand:
%
%    exp ( cos ( x ) )
%
%  Approximate Integral (20 digits):
%
%    7.9549265210128452745...
%
%  Exact Integral:
%
%    2 * pi * I0(1)
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
%    Prentice Hall, 1984, page 262.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = exp ( cos ( x(1:n) ) );

  return
end
