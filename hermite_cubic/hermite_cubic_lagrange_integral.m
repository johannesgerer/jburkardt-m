function q = hermite_cubic_lagrange_integral ( x1, x2 )

%*****************************************************************************80
%
%% HERMITE_CUBIC_LAGRANGE_INTEGRAL: Hermite cubic Lagrange integrals.
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
%    This function returns the integrals of these four polynomials over
%    the domain of definition [X1,X2].
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
%    Output, real Q(4), the integrals of the Hermite cubic Lagrange polynomials
%    from X1 to X2.
%
  h = x2 - x1;

  q(1) =   h   / 2.0;
  q(2) =   h^2 / 12.0;
  q(3) =   h   / 2.0;
  q(4) = - h^2 / 12.0;

  return
end
