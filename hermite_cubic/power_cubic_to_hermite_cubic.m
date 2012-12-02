function [ f1, d1, f2, d2 ] = power_cubic_to_hermite_cubic ( c0, c1, c2, c3, ...
  x1, x2 )

%*****************************************************************************80
%
%% POWER_CUBIC_TO_HERMITE_CUBIC converts a power cubic to Hermite form.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2011
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
%    Input, real C0, C1, C2, C3, the power form of the polynomial.
%
%    Input, real X1, X2, the left and right endpoints of the Hermite form.
%
%    Output, real F1, D1, the function and derivative values at X1.
%
%    Output, real F2, D2, the function and derivative values at X2.
%
  f1 = c0 + x1 .* ( c1 + x1 .* (        c2 + x1        .* c3 ) );
  d1 =              c1 + x1 .* ( 2.0 .* c2 + x1 .* 3.0 .* c3 );

  f2 = c0 + x2 .* ( c1 + x2 .* (        c2 + x2        .* c3 ) );
  d2 =              c1 + x2 .* ( 2.0 .* c2 + x2 .* 3.0 .* c3 );

  return
end
