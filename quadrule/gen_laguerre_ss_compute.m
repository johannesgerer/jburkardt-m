function [ x, w ] = gen_laguerre_ss_compute ( n, alpha )

%*****************************************************************************80
%
%% GEN_LAGUERRE_SS_COMPUTE computes a generalized Gauss-Laguerre quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( 0 <= X < +oo ) EXP ( - X ) * X^ALPHA * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    The integral:
%
%      Integral ( 0 <= X < +oo ) X^ALPHA * F(X) dX
%
%    The quadrature:
%
%      Sum ( 1 <= I <= N ) W(I) * EXP ( X(I) ) * F ( X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2010
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
%    Input, integer N, the order.
%    N must be at least 1.
%
%    Input, real ALPHA, the exponent of the X factor.
%    Set ALPHA = 0.0 for the simplest rule.
%    ALPHA must be nonnegative.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );
%
%  Set the recursion coefficients.
%
  for i = 1 : n
    b(i) = ( alpha + 2 * i - 1 );
  end

  for i = 1 : n
    c(i) = ( i - 1 ) * ( alpha + i - 1 );
  end

  cc = gamma ( alpha + 1.0 ) * prod ( c(2:n) );

  for i = 1 : n
%
%  Compute an estimate for the root.
%
    if ( i == 1 )

      xval = ( 1.0 + alpha ) * ( 3.0 + 0.92 * alpha ) ...
        / ( 1.0 + 2.4 * n + 1.8 * alpha );

    elseif ( i == 2 )

      xval = xval + ( 15.0 + 6.25 * alpha ) / ( 1.0 + 0.9 * alpha + 2.5 * n );

    else

      r1 = ( 1.0 + 2.55 * ( i - 2 ) ) / ( 1.9 * ( i - 2 ) );

      r2 = 1.26 * ( i - 2 ) * alpha / ( 1.0 + 3.5 * ( i - 2 ) );

      ratio = ( r1 + r2 ) / ( 1.0 + 0.3 * alpha );

      xval = xval + ratio * ( xval - x(i-2) );

    end
%
%  Use iteration to find the root.
%
    [ xval, dp2, p1 ] = gen_laguerre_ss_root ( xval, n, alpha, b, c );
%
%  Set the abscissa and weight.
%
    x(i) = xval;
    w(i) = ( cc / dp2 ) / p1;

  end

  return
end

