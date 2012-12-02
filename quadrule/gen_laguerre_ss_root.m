function [ x, dp2, p1 ] = gen_laguerre_ss_root ( x, n, alpha, b, c )

%*****************************************************************************80
%
%% GEN_LAGUERRE_SS_ROOT improves an approximate root of a generalized Laguerre polynomial.
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
%    John Burkardt
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
%    Input, real X, the approximate root, which
%    should be improved on output.
%
%    Input, integer N, the order of the polynomial.
%
%    Input, real ALPHA, the exponent of the X factor.
%
%    Input, real B(N), C(N), the recursion coefficients.
%
%    Output, real X, the approximate root, which
%    should be improved on output.
%
%    Output, real DP2, the value of L'(N)(X).
%
%    Output, real P1, the value of L(N-1)(X).
%
  maxstep = 10;

  for i = 1 : maxstep

    [ p2, dp2, p1 ] = gen_laguerre_ss_recur ( x, n, alpha, b, c );

    d = p2 / dp2;
    x = x - d;

    if ( abs ( d ) <= eps * ( abs ( x ) + 1.0 ) )
      return;
    end

  end

  return
end
