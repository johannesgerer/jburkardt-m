function [ p2, dp2, p1 ] = gen_laguerre_ss_recur ( x, order, alpha, b, c )

%*****************************************************************************80
%
%% GEN_LAGUERRE_SS_RECUR finds the value and derivative of a generalized Laguerre polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2008
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
%    Input, real ALPHA, the exponent of the X factor in the
%    integrand.
%
%    Input, real B(ORDER), C(ORDER), the recursion
%    coefficients.
%
%    Output, real P2, the value of L(ORDER)(X).
%
%    Output, real DP2, the value of L'(ORDER)(X).
%
%    Output, real P1, the value of L(ORDER-1)(X).
%
  p1 = 1.0;
  dp1 = 0.0;

  p2 = x - alpha - 1.0;
  dp2 = 1.0;

  for i = 2 : order

    p0 = p1;
    dp0 = dp1;

    p1 = p2;
    dp1 = dp2;

    p2 = ( x - b(i) ) * p1 - c(i) * p0;
    dp2 = ( x - b(i) ) * dp1 + p1 - c(i) * dp0;

  end

  return
end
