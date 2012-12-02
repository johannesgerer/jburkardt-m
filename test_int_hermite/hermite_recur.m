function [ p2, dp2, p1 ] = hermite_recur ( x, norder )

%*****************************************************************************80
%
%% HERMITE_RECUR finds the value and derivative of a Hermite polynomial.
%
%  Modified:
%
%    15 October 2005
%
%  Author:
%
%    Original FORTRAN77 version by Arthur Stroud, Don Secrest
%    MATLAB version by John Burkardt
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
%    Input, integer NORDER, the order of the polynomial to be computed.
%
%    Output, P2, the value of H(NORDER)(X).
%
%    Output, DP2, the value of H'(NORDER)(X).
%
%    Output, P1, the value of H(NORDER-1)(X).
%
  p1 = 1.0;
  dp1 = 0.0;

  p2 = x;
  dp2 = 1.0;

  for i = 2 : norder

    p0 = p1;
    dp0 = dp1;

    p1 = p2;
    dp1 = dp2;

    p2  = x * p1 - 0.5 * ( i - 1.0 ) * p0;
    dp2 = x * dp1 + p1 - 0.5 * ( i - 1.0 ) * dp0;

  end

  return
end
