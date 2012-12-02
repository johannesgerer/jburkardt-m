function fx = p32_fun ( n, x )

%*****************************************************************************80
%
%% P32_FUN evaluates the integrand for problem 32.
%
%  Interval:
%
%    0 <= x <= pi
%
%  Integrand:
%
%    exp ( x ) * cos ( x )
%
%  Antiderivative:
%
%    0.5 * exp ( x ) * ( sin ( X ) + cos ( x ) )
%
%  Exact Integral:
%
%    - 0.5 * ( exp ( PI ) + 1 )
%
%  Approximate Integral (20 digits):
%
%    -12.070346316389634503...
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
%    Prentice Hall, 1984, page 254, 277, 297.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = exp ( x(1:n) ) .* cos ( x(1:n) );

  return
end
