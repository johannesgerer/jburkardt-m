function [ x, w ] = gen_laguerre_ss_compute ( order, alpha )

%*****************************************************************************80
%
%% GEN_LAGUERRE_SS_COMPUTE computes a Generalized Laguerre quadrature rule.
%
%  Discussion:
%
%    The integration interval is [ 0, +oo ).
%
%    The weight function w(x) = exp ( - X ) * X^ALPHA.
%
%
%    If the integral to approximate is:
%
%        Integral ( 0 <= X < +oo ) exp ( - X ) * X^ALPHA * F(X) dX
%
%    then the quadrature rule is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%
%    If the integral to approximate is:
%
%        Integral ( 0 <= X < +oo ) X^ALPHA * F(X) dX
%
%    then the quadrature rule is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * exp ( X(I) ) * F ( X(I) )
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
%    Input, integer ORDER, the order of the quadrature rule to be computed.
%    ORDER must be at least 1.
%
%    Input, real ALPHA, the exponent of the X factor.
%    Set ALPHA = 0.0 for the simplest rule.
%    ALPHA must be nonnegative.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEN_LAGUERRE_SS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'GEN_LAGUERRE_SS_COMPUTE - Fatal error!' );
  end
  
  x = zeros ( order, 1 );
  w = zeros ( order, 1 );
%
%  Set the recursion coefficients.
%
  b = zeros ( order, 1);
  for i = 1 : order
    b(i) = ( alpha + 2 * i - 1 );
  end

  c = zeros ( order, 1 );
  for i = 1 : order
    c(i) = ( i - 1 ) * ( alpha + i - 1 );
  end

  cc = gamma ( alpha + 1.0 ) * prod ( c(2:order) );

  for i = 1 : order
%
%  Compute an estimate for the root.
%
    if ( i == 1 )

      x0 = ( 1.0 + alpha ) * ( 3.0 + 0.92 * alpha ) ...
        / ( 1.0 + 2.4 * order + 1.8 * alpha );

    elseif ( i == 2 )

      x0 = x0 + ( 15.0 + 6.25 * alpha ) ...
        / ( 1.0 + 0.9 * alpha + 2.5 * order );

    else

      r1 = ( 1.0 + 2.55 * ( i - 2 ) ) / ( 1.9 * ( i - 2 ) );

      r2 = 1.26 * ( i - 2 ) * alpha / ( 1.0 + 3.5 * ( i - 2 ) );

      ratio = ( r1 + r2 ) / ( 1.0 + 0.3 * alpha );

      x0 = x0 + ratio * ( x0 - x(i-2) );

    end
%
%  Use iteration to find the root.
%
    [ x0, dp2, p1 ] = gen_laguerre_ss_root ( x0, order, alpha, b, c );
%
%  Set the abscissa and weight.
%
    x(i) = x0;
    w(i) = ( cc / dp2 ) / p1;

  end

  return
end
