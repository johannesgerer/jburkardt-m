function [ x, dp2, p1 ] = jacobi_ss_root ( x, n, alpha, beta, b, c )

%*****************************************************************************80
%
%% JACOBI_SS_ROOT improves an approximate root of a Jacobi polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
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
%    Input, integer N, the order of the polynomial to be computed.
%
%    Input, real ALPHA, BETA, the exponents of (1-X) and
%    (1+X) in the quadrature rule.
%
%    Input, real B(N), C(N), the recursion coefficients.
%
%    Output, real X, the improved approximate root.
%
%    Output, real DP2, the value of J'(N)(X).
%
%    Output, real P1, the value of J(N-1)(X).
%
  maxstep = 10;

  for i = 1 : maxstep

    [ p2, dp2, p1 ] = jacobi_ss_recur ( x, n, alpha, beta, b, c );

    d = p2 / dp2;
    x = x - d;

    if ( abs ( d ) <= eps * ( abs ( x ) + 1.0 ) )
      return
    end

  end

  return
end
