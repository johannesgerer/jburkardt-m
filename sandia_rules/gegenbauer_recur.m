function [ p2, dp2, p1 ] = gegenbauer_recur ( x, order, alpha, c )

%*****************************************************************************80
%
%% GEGENBAUER_RECUR finds the value and derivative of a Gegenbauer polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2008
%
%  Author:
%
%    Original FORTRAN77 version by Arthur Stroud, Don Secrest.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, real X, the point at which polynomials are evaluated.
%
%    Input, integer ORDER, the order of the polynomial to be computed.
%
%    Input, real ALPHA, the exponent of (1-X^2) in the quadrature rule.
%
%    Input, real C(ORDER), the recursion coefficients.
%
%    Output, real P2, the value of J(ORDER)(X).
%
%    Output, real DP2, the value of J'(ORDER)(X).
%
%    Output, real P1, the value of J(ORDER-1)(X).
%
  p1 = 1.0;
  dp1 = 0.0;

  p2 = x;
  dp2 = 1.0;

  for i = 2 : order

    p0 = p1;
    dp0 = dp1;

    p1 = p2;
    dp1 = dp2;

    p2 = x * p1 - c(i) * p0;
    dp2 = x * dp1 + p1 - c(i) * dp0;

  end

  return
end
