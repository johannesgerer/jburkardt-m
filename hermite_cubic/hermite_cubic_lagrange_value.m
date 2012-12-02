function [ f, d, s, t ] = hermite_cubic_lagrange_value ( x1, x2, n, x )

%*****************************************************************************80
%
%% HERMITE_CUBIC_LAGRANGE_VALUE evaluates the Hermite cubic Lagrange polynomials.
%
%  Discussion:
%
%    The Hermite cubic polynomial P(X) for interval (X1,X2) and data
%    (F1,D1,F2,D2) satisfies:
%
%      P(X1) = F1,
%      P'(X1) = D1,
%      P(X2) = F2,
%      P'(X2) = D2.
%
%    We can determine four Lagrange polynomials L1(X) through L4(X) so that
%
%      P(X) = F1 * L1(X) + D1 * L2(X) + F2 * L3(X) + D2 * L4(X).
%
%    This function returns the values and derivatives of these four
%    polynomials.
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
%    Input, real X1, X2, the endpoints.
%
%    Input, integer N, the number of sample points.
%
%    Input, real X(N), the sample points.
%
%    Output, real F(4,N), D(4,N), S(4,N), T(4,N), the value and first
%    three derivatives of the Hermite cubic Lagrange polynomials at X.
%
  f = zeros ( 4, n );
  d = zeros ( 4, n );
  s = zeros ( 4, n );
  t = zeros ( 4, n );

  h = x2 - x1;
  dx = x - x1;
%
%  F1.
%
  f(1,1:n) = 1.0 + (  dx / h ) .* ( dx / h ) .* ( - 3.0 + ( dx / h ) *  2.0 );
  d(1,1:n) =       ( 1.0 / h ) .* ( dx / h ) .* ( - 6.0 + ( dx / h ) *  6.0 );
  s(1,1:n) =       ( 1.0 / h )^2             .* ( - 6.0 + ( dx / h ) * 12.0 );
  t(1,1:n) =       ( 1.0 / h )^3                                     * 12.0;
%
%  D1
%
  f(2,1:n) = dx .* ( 1.0 + ( dx / h ) .* ( - 2.0 + ( dx / h )       ) );
  d(2,1:n) = 1.0         + ( dx / h ) .* ( - 4.0 + ( dx / h ) * 3.0 );
  s(2,1:n) =               ( 1.0 / h ) * ( - 4.0 + ( dx / h ) * 6.0 );
  t(2,1:n) =               ( 1.0 / h )^2                      * 6.0;
%
%  F2
%
  f(3,1:n) = (  dx / h ) .* ( dx / h ) .* ( 3.0 -  2.0 * ( dx / h ) );
  d(3,1:n) = ( 1.0 / h ) .* ( dx / h ) .* ( 6.0 -  6.0 * ( dx / h ) );
  s(3,1:n) =             ( 1.0 / h )^2 .* ( 6.0 - 12.0 * ( dx / h ) );
  t(3,1:n) =             ( 1.0 / h )^3 *      ( - 12.0 );
%
%  D2
%
  f(4,1:n) = dx .* ( dx / h ) .* ( - 1.0 + ( dx / h )       );
  d(4,1:n) =       ( dx / h ) .* ( - 2.0 + ( dx / h ) * 3.0 );
  s(4,1:n) =       ( 1.0 / h ) * ( - 2.0 + ( dx / h ) * 6.0 );
  t(4,1:n) =       ( 1.0 / h )                        * 6.0;

  return
end
