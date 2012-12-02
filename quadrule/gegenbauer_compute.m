function [ x, w ] = gegenbauer_compute ( n, alpha )

%*****************************************************************************80
%
%% GEGENBAUER_COMPUTE computes the abscissa and weights for Gauss-Gegenbauer quadrature.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= 1 ) (1-X^2)^ALPHA * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
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
%    13 February 2010
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
%
%    Input, real ALPHA, the exponent of (1-X^2) in the weight.  
%    -1.0 < ALPHA is required.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Check N.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEGENBAUER_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  1 <= N is required.\n' );
    error ( 'GEGENBAUER_COMPUTE - Fatal error!' );
  end
%
%  Check ALPHA.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEGENBAUER_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  -1.0 < ALPHA is required.\n' );
    error ( 'GEGENBAUER_COMPUTE - Fatal error!' );
  end

  x = zeros ( n, 1 );
  w = zeros ( n, 1 );
%
%  Set the recursion coefficients.
%
  c(1) = 0.0;
  if ( 2 <= n )
    c(2) = 1.0 / ( 2.0 * alpha + 3.0 );
  end

  for i = 3 : n

    c(i) = ( i - 1 ) ...
      * ( alpha + alpha + i - 1 ) / ...
      ( ( alpha + alpha + 2 * i - 1 ) ...
      * ( alpha + alpha + 2 * i - 3 ) );

  end

  delta = gamma ( alpha         + 1.0 ) ...
        * gamma (         alpha + 1.0 ) ...
        / gamma ( alpha + alpha + 2.0 );

  cc = delta * 2.0^( 2.0 * alpha + 1.0 ) * prod ( c(2:n) );

  for i = 1 : n

    if ( i == 1 )

      an = alpha / n;

      r1 = ( 1.0 + alpha ) * ( 2.78 / ( 4.0 + n * n ) ...
        + 0.768 * an / n );

      r2 = 1.0 + 2.44 * an + 1.281 * an^2;

      xval = ( r2 - r1 ) / r2;

    elseif ( i == 2 )

      r1 = ( 4.1 + alpha ) / ...
        ( ( 1.0 + alpha ) * ( 1.0 + 0.156 * alpha ) );

      r2 = 1.0 + 0.06 * ( n - 8.0 ) * ( 1.0 + 0.12 * alpha ) / n;

      r3 = 1.0 + 0.012 * alpha * ( 1.0 + 0.25 * abs ( alpha ) ) / n;

      xval = xval - r1 * r2 * r3 * ( 1.0 - xval );

    elseif ( i == 3 )

      r1 = ( 1.67 + 0.28 * alpha ) / ( 1.0 + 0.37 * alpha );

      r2 = 1.0 + 0.22 * ( n - 8.0 ) / n;

      r3 = 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * n * n );

      xval = xval - r1 * r2 * r3 * ( x(1) - xval );

    elseif ( i < n - 1 )

      xval = 3.0 * x(i-1) - 3.0 * x(i-2) + x(i-3);

    elseif ( i == n - 1 )

      r1 = ( 1.0 + 0.235 * alpha ) / ( 0.766 + 0.119 * alpha );

      r2 = 1.0 / ( 1.0 + 0.639 * ( n - 4.0 ) ...
        / ( 1.0 + 0.71 * ( n - 4.0 ) ) );

      r3 = 1.0 / ( 1.0 + 20.0 * alpha / ( ( 7.5 + alpha ) * n * n ) );

      xval = xval + r1 * r2 * r3 * ( xval - x(i-2) );

    elseif ( i == n )

      r1 = ( 1.0 + 0.37 * alpha ) / ( 1.67 + 0.28 * alpha );

      r2 = 1.0 / ( 1.0 + 0.22 * ( n - 8.0 ) / n );

      r3 = 1.0 / ( 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * n * n ) );

      xval = xval + r1 * r2 * r3 * ( xval - x(i-2) );

    end

    [ xval, dp2, p1 ] = gegenbauer_root ( xval, n, alpha, c );

    x(i) = xval;
    w(i) = cc / ( dp2 * p1 );

  end
%
%  Reverse the order of the values.
%
  x(1:n) = x(n:-1:1);
  w(1:n) = w(n:-1:1);

  return
end
