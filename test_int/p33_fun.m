function fx = p33_fun ( n, x )

%*****************************************************************************80
%
%% P33_FUN evaluates the integrand for problem 33.
%
%  Discussion:
%
%    The integrand is singular at both endpoints of the interval.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    sqrt ( - ln ( x ) )
%
%  Exact Integral:
%
%    sqrt ( pi ) / 2
%
%  Approximate Integral (20 digits):
%
%    0.88622692545275801365...
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
%    Prentice Hall, 1984, page 307.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = sqrt ( - log ( x ) );

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
