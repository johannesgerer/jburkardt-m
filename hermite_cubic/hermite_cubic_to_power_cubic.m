function [ c0, c1, c2, c3 ] = hermite_cubic_to_power_cubic ( x1, f1, d1, ...
  x2, f2, d2 )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TO_POWER_CUBIC converts a Hermite cubic to power form.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2011
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Fred Fritsch, Ralph Carlson,
%    Monotone Piecewise Cubic Interpolation,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 238-246.
%
%  Parameters:
%
%    Input, real X1, F1, D1, the left endpoint, function value and derivative.
%
%    Input, real X2, F2, D2, the right endpoint, function value and derivative.
%
%    Output, real C0, C1, C2, C3, the power form of the polynomial.
%
  h =    x2 - x1;
  df = ( f2 - f1 ) / h;
%
%  Polynomial in terms of X - X1:
%
  c0 = f1;
  c1 = d1;
  c2 = - ( 2.0 * d1 - 3.0 * df + d2 ) / h;
  c3 =   (       d1 - 2.0 * df + d2 ) / h / h;
%
%  Shift polynomial to X.
%
  c2 = c2 - x1 * c3;
  c1 = c1 - x1 * c2;
  c0 = c0 - x1 * c1;
  c2 = c2 - x1 * c3;
  c1 = c1 - x1 * c2;
  c2 = c2 - x1 * c3;

  return
end
