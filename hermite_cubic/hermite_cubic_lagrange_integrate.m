function q = hermite_cubic_lagrange_integrate ( x1, x2, a, b )

%*****************************************************************************80
%
%% HERMITE_CUBIC_LAGRANGE_INTEGRATE integrates Hermite cubic Lagrange polynomials.
%
%  Discussion:
%
%    A and B may be scalars, or one may be a vector, or both
%    may be vectors of the same size.
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
%    Input, real X1, X2, the endpoints of the interval of definition.
%
%    Input, real A, B, the left and right endpoints of the interval
%    of integration.
%
%    Output, real Q(4), the integrals of the Hermite cubic Lagrange polynomials
%    over the interval A <= X <= B.
%
  h = x2 - x1;
  ta1 = ( a - x1 ) / h;
  ta2 = ( x2 - a ) / h;
  tb1 = ( b - x1 ) / h;
  tb2 = ( x2 - b ) / h;

  ua1 = ta1 .* ta1 .* ta1;
  phia1 = ua1 .* ( 2.0 - ta1 );
  psia1 = ua1 .* ( 3.0 .* ta1 - 4.0 );

  ua2 = ta2 .* ta2 .* ta2;
  phia2 =  ua2 .* ( 2.0 - ta2 );
  psia2 = -ua2 .* ( 3.0 .* ta2 - 4.0 );

  ub1 = tb1 .* tb1 .* tb1;
  phib1 = ub1 .* ( 2.0 - tb1 );
  psib1 = ub1 .* ( 3.0 .* tb1 - 4.0 );

  ub2 = tb2 .* tb2 .* tb2;
  phib2 =  ub2 .* ( 2.0 - tb2 );
  psib2 = -ub2 .* ( 3.0 .* tb2 - 4.0 );

  q(1) = 0.5 * h * ( phia2 - phib2 );
  q(2) = 0.5 * h * ( psia2 - psib2 ) * ( h / 6.0 );
  q(3) = 0.5 * h * ( phib1 - phia1 );
  q(4) = 0.5 * h * ( psib1 - psia1 ) * ( h / 6.0 );

  return
end
