function [ x, w ] = jacobi_ss_compute ( order, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_SS_COMPUTE computes the abscissa and weights for Jacobi quadrature.
%
%  Discussion:
%
%    The integration interval is [ -1, 1 ].
%
%    The weight function is w(x) = (1-X)^ALPHA * (1+X)^BETA.
%
%    The integral to approximate is:
%
%      Integral ( -1 <= X <= 1 ) (1-X)^ALPHA * (1+X)^BETA * F(X) dX
%
%    The quadrature formula is:
%
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%    Thanks to Xu Xiang of Fudan University for pointing out that
%    an earlier implementation of this routine was incorrect!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2008
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
%
%    Input, real ALPHA, BETA, the exponents of (1-X) and
%    (1+X) in the quadrature rule.  For simple Legendre quadrature,
%    set ALPHA = BETA = 0.0.  -1.0 < ALPHA and -1.0 < BETA are required.
%
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_SS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'JACOBI_SS_COMPUTE - Fatal error!' );
  end
%
%  Check ALPHA and BETA.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_SS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  -1.0 < ALPHA is required.\n' );
    error ( 'JACOBI_SS_COMPUTE - Fatal error!' );
  end

  if ( beta <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_SS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  -1.0 < BETA is required.\n' );
    error ( 'JACOBI_SS_COMPUTE - Fatal error!' );
  end

  x = zeros ( order, 1 );
  w = zeros ( order, 1 );
%
%  Set the recursion coefficients.
%
  b = zeros ( order, 1 );
  c = zeros ( order, 1 );

  for i = 1 : order

    if ( alpha + beta == 0.0 || beta - alpha == 0.0 )

      b(i) = 0.0;

    else

      b(i) = ( alpha + beta ) * ( beta - alpha ) / ...
            ( ( alpha + beta + 2 * i ) ...
            * ( alpha + beta + 2 * i - 2 ) );

    end

    if ( i == 1 )

      c(i) = 0.0;

    else

      c(i) = 4.0 * ( i - 1 ) * ( alpha + i - 1 ) * ( beta + i - 1 ) ...
        * ( alpha + beta + i - 1 ) / ( ( alpha + beta + 2 * i - 1 ) ...
        * ( alpha + beta + 2 * i - 2 )^2 * ( alpha + beta + 2 * i - 3 ) );

    end

  end

  delta = gamma ( alpha        + 1.0 ) ...
        * gamma (         beta + 1.0 ) ...
        / gamma ( alpha + beta + 2.0 );

  cc = delta * 2.0^( alpha + beta + 1.0 ) * prod ( c(2:order) );

  for i = 1 : order

    if ( i == 1 )

      an = alpha / order;
      bn = beta / order;

      r1 = ( 1.0 + alpha ) * ( 2.78 / ( 4.0 + order * order ) ...
        + 0.768 * an / order );

      r2 = 1.0 + 1.48 * an + 0.96 * bn + 0.452 * an^2 + 0.83 * an * bn;

      x0 = ( r2 - r1 ) / r2;

    elseif ( i == 2 )

      r1 = ( 4.1 + alpha ) / ...
        ( ( 1.0 + alpha ) * ( 1.0 + 0.156 * alpha ) );

      r2 = 1.0 + 0.06 * ( order - 8.0 ) * ( 1.0 + 0.12 * alpha ) / order;

      r3 = 1.0 + 0.012 * beta * ...
        ( 1.0 + 0.25 * abs ( alpha ) ) / order;

      x0 = x0 - r1 * r2 * r3 * ( 1.0 - x0 );

    elseif ( i == 3 )

      r1 = ( 1.67 + 0.28 * alpha ) / ( 1.0 + 0.37 * alpha );

      r2 = 1.0 + 0.22 * ( order - 8.0 ) / order;

      r3 = 1.0 + 8.0 * beta / ( ( 6.28 + beta ) * order * order );

      x0 = x0 - r1 * r2 * r3 * ( x(1) - x0 );

    elseif ( i < order - 1 )

      x0 = 3.0 * x(i-1) - 3.0 * x(i-2) + x(i-3);

    elseif ( i == order - 1 )

      r1 = ( 1.0 + 0.235 * beta ) / ( 0.766 + 0.119 * beta );

      r2 = 1.0 / ( 1.0 + 0.639 * ( order - 4.0 ) ...
        / ( 1.0 + 0.71 * ( order - 4.0 ) ) );

      r3 = 1.0 / ( 1.0 + 20.0 * alpha / ( ( 7.5 + alpha ) * order * order ) );

      x0 = x0 + r1 * r2 * r3 * ( x0 - x(i-2) );

    elseif ( i == order )

      r1 = ( 1.0 + 0.37 * beta ) / ( 1.67 + 0.28 * beta );

      r2 = 1.0 / ( 1.0 + 0.22 * ( order - 8.0 ) / order );

      r3 = 1.0 / ( 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * order * order ) );

      x0 = x0 + r1 * r2 * r3 * ( x0 - x(i-2) );

    end

    [ x0, dp2, p1 ] = jacobi_ss_root ( x0, order, alpha, beta, b, c );

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
