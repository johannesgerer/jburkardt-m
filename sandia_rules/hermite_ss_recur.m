function [ p2, dp2, p1 ] = hermite_ss_recur ( x, order )

%*****************************************************************************80
%
%% HERMITE_SS_RECUR finds the value and derivative of a Hermite polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2011
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
%    Output, P2, the value of H(ORDER)(X).
%
%    Output, DP2, the value of H'(ORDER)(X).
%
%    Output, P1, the value of H(ORDER-1)(X).
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

    p2  = x * p1 - 0.5 * ( i - 1.0 ) * p0;
    dp2 = x * dp1 + p1 - 0.5 * ( i - 1.0 ) * dp0;

  end

  return
end
