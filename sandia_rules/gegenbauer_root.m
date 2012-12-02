function [ x, dp2, p1 ] = gegenbauer_root ( x, order, alpha, c )

%*****************************************************************************80
%
%% GEGENBAUER_ROOT improves an approximate root of a Gegenbauer polynomial.
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
%    Input, real X, the approximate root.
%
%    Input, integer ORDER, the order of the polynomial to be computed.
%
%    Input, real ALPHA, the exponent of (1-X^2) in the quadrature rule.
%
%    Input, real C(ORDER), the recursion coefficients.
%
%    Output, real X, the improved approximate root.
%
%    Output, real DP2, the value of J'(ORDER)(X).
%
%    Output, real P1, the value of J(ORDER-1)(X).
%
  step_max = 10;

  for i = 1 : step_max

    [ p2, dp2, p1 ] = gegenbauer_recur ( x, order, alpha, c );

    d = p2 / dp2;
    x = x - d;

    if ( abs ( d ) <= eps * ( abs ( x ) + 1.0 ) )
      return
    end

  end

  return
end
