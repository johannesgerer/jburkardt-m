function [ f, d, s, t ] = hermite_cubic_value ( x1, f1, d1, x2, f2, d2, n, x )

%*****************************************************************************80
%
%% HERMITE_CUBIC_VALUE evaluates a Hermite cubic polynomial.
%
%  Discussion:
%
%    The input arguments can be vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2011
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
%    Input, integer N, the number of sample points.
%
%    Input, real X(N), the point at which the Hermite cubic is to be evaluated.
%
%    Output, real F(N), D(N), S(N), T(N), the value and first three derivatives
%    of the Hermite cubic at X.
%
  h =    x2 - x1;
  df = ( f2 - f1 ) ./ h;

  c2 = - ( 2.0 * d1 - 3.0 * df + d2 ) ./ h;
  c3 =   (       d1 - 2.0 * df + d2 ) ./ h ./ h;

  dx = x - x1;
  f = f1 + dx .* ( d1 + dx .* (        c2 + dx .*        c3 ) );
  d =              d1 + dx .* ( 2.0 .* c2 + dx .* 3.0 .* c3 );
  s =                           2.0 .* c2 + dx .* 6.0 .* c3;
  t =                                             6.0 .* c3;

  return
end
