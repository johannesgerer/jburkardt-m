function fx = p31_fun ( n, x )

%*****************************************************************************80
%
%% P31_FUN evaluates the integrand for problem 31.
%
%  Discussion:
%
%    A simple Newton-Cotes quadrature rule, in which the order of the
%    rule is increased, but the interval is not subdivided, diverges
%    for this integrand.
%
%    This is Runge's function, a standard example of the perils of
%    using high order polynomial interpolation at equally spaced nodes.
%    Since this is exactly what is really going on in a Newton Cotes
%    rule, it is little wonder that the result is so poor.
%
%  Interval:
%
%    -4 <= x <= 4
%
%  Integrand:
%
%    1 / ( 1 + x^2 )
%
%  Antiderivative:
%
%    arctan ( x )
%
%  Exact Integral:
%
%    2 * arctan ( 4 )
%
%  Approximate Integral (20 digits):
%
%    2.6516353273360649301...
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
%    Prentice Hall, 1984, page 266.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = 1.0 ./ ( 1.0 + x.^2 );

  return
end
