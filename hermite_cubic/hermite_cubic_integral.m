function q = hermite_cubic_integral ( x1, f1, d1, x2, f2, d2 )

%*****************************************************************************80
%
%% HERMITE_CUBIC_INTEGRAL returns the integral of a Hermite cubic polynomial.
%
%  Discussion:
%
%    The integral is taken over the definition interval [X1,X2].
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
%    Output, real Q, the integral of the Hermite cubic polynomial
%    over the interval X1 <= X <= X2.
%
  h = x2 - x1;

  q = 0.5 * h * ( f1 + f2 + h * ( d1 - d2 ) / 6.0 );

  return
end
