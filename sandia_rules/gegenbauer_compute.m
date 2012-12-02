function [ x, w ] = gegenbauer_compute ( order, alpha )

%*****************************************************************************80
%
%% GEGENBAUER_COMPUTE computes the abscissa and weights for Gegenbauer quadrature.
%
%  Discussion:
%
%    The weight function is w(x) = (1-X^2)^ALPHA.
%
%    The integral to approximate is:
%
%      Integral ( -1 <= X <= 1 ) (1-X^2)^ALPHA * F(X) dX
%
%    The quadrature formula is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%    Thanks to Janiki Raman for pointing out a problem in an earlier
%    version of the code that occurred when ALPHA was -0.5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2010
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
%    Input, integer ORDER, the order of the quadrature rule.
%
%    Input, real ALPHA, the exponent of (1-X^2) in the weight.  
%    -1.0 < ALPHA is required.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%

%
%  Check ORDER.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEGENBAUER_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  1 <= ORDER is required.\n' );
    error ( 'GEGENBAUER_COMPUTE - Fatal error!' );
  end
  
  x = zeros ( order, 1 );
  w = zeros ( order, 1 );
%
%  Check ALPHA.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEGENBAUER_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  -1.0 < ALPHA is required.\n' );
    error ( 'GEGENBAUER_COMPUTE - Fatal error!' );
  end
%
%  Set the recursion coefficients.
%
  c = zeros ( order, 1 );

  c(1) = 0.0;
  if ( 2 <= order )
    c(2) = 1.0 / ( 2.0 * alpha + 3.0 );
  end

  for i = 3 : order

    c(i) = ( i - 1 ) ...
      * ( alpha + alpha + i - 1 ) / ...
      ( ( alpha + alpha + 2 * i - 1 ) ...
      * ( alpha + alpha + 2 * i - 3 ) );

  end

  delta = gamma ( alpha         + 1.0 ) ...
        * gamma (         alpha + 1.0 ) ...
        / gamma ( alpha + alpha + 2.0 );

  cc = delta * 2.0^( 2.0 * alpha + 1.0 ) * prod ( c(2:order) );

  for i = 1 : order

    if ( i == 1 )

      an = alpha / order;

      r1 = ( 1.0 + alpha ) * ( 2.78 / ( 4.0 + order * order ) ...
        + 0.768 * an / order );

      r2 = 1.0 + 2.44 * an + 1.281 * an^2;

      x0 = ( r2 - r1 ) / r2;

    elseif ( i == 2 )

      r1 = ( 4.1 + alpha ) / ...
        ( ( 1.0 + alpha ) * ( 1.0 + 0.156 * alpha ) );

      r2 = 1.0 + 0.06 * ( order - 8.0 ) * ( 1.0 + 0.12 * alpha ) / order;

      r3 = 1.0 + 0.012 * alpha * ...
        ( 1.0 + 0.25 * abs ( alpha ) ) / order;

      x0 = x0 - r1 * r2 * r3 * ( 1.0 - x0 );

    elseif ( i == 3 )

      r1 = ( 1.67 + 0.28 * alpha ) / ( 1.0 + 0.37 * alpha );

      r2 = 1.0 + 0.22 * ( order - 8.0 ) / order;

      r3 = 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * order * order );

      x0 = x0 - r1 * r2 * r3 * ( x(1) - x0 );

    elseif ( i < order - 1 )

      x0 = 3.0 * x(i-1) - 3.0 * x(i-2) + x(i-3);

    elseif ( i == order - 1 )

      r1 = ( 1.0 + 0.235 * alpha ) / ( 0.766 + 0.119 * alpha );

      r2 = 1.0 / ( 1.0 + 0.639 * ( order - 4.0 ) ...
        / ( 1.0 + 0.71 * ( order - 4.0 ) ) );

      r3 = 1.0 / ( 1.0 + 20.0 * alpha / ( ( 7.5 + alpha ) * order * order ) );

      x0 = x0 + r1 * r2 * r3 * ( x0 - x(i-2) );

    elseif ( i == order )

      r1 = ( 1.0 + 0.37 * alpha ) / ( 1.67 + 0.28 * alpha );

      r2 = 1.0 / ( 1.0 + 0.22 * ( order - 8.0 ) / order );

      r3 = 1.0 / ( 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * order * order ) );

      x0 = x0 + r1 * r2 * r3 * ( x0 - x(i-2) );

    end

    [ x0, dp2, p1 ] = gegenbauer_root ( x0, order, alpha, c );

    x(i) = x0;
    w(i) = cc / ( dp2 * p1 );

  end
%
%  Reverse the order of the values.
%
  x(1:order) = x(order:-1:1);
  w(1:order) = w(order:-1:1);

  return
end

