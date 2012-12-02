function [ x, w ] = jacobi_ss_compute ( n, alpha, beta )

%*****************************************************************************80
%
%% JACOBI_SS_COMPUTE computes the abscissa and weights for Gauss-Jacobi quadrature.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= 1 ) (1-X)**ALPHA * (1+X)**BETA * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
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
%    12 October 2011
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
%    Input, real ALPHA, BETA, the exponents of (1-X) and
%    (1+X) in the quadrature rule.  For simple Gauss-Legendre quadrature,
%    set ALPHA = BETA = 0.0.  -1.0 < ALPHA and -1.0 < BETA are required.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

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

  x = zeros ( n, 1 );
  w = zeros ( n, 1 );
  b = zeros ( n, 1 );
  c = zeros ( n, 1 );
%
%  Set the recursion coefficients.
%
  for i = 1 : n

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

  delta = exp ( gammaln ( alpha        + 1.0 ) ...
              + gammaln (         beta + 1.0 ) ...
              - gammaln ( alpha + beta + 2.0 ) );

  cc = delta * 2.0^( alpha + beta + 1.0 ) * prod ( c(2:n) );

  for i = 1 : n

    if ( i == 1 )

      an = alpha / n;
      bn = beta / n;

      r1 = ( 1.0 + alpha ) * ( 2.78 / ( 4.0 + n * n ) ...
        + 0.768 * an / n );

      r2 = 1.0 + 1.48 * an + 0.96 * bn + 0.452 * an^2 + 0.83 * an * bn;

      xval = ( r2 - r1 ) / r2;

    elseif ( i == 2 )

      r1 = ( 4.1 + alpha ) / ...
        ( ( 1.0 + alpha ) * ( 1.0 + 0.156 * alpha ) );

      r2 = 1.0 + 0.06 * ( n - 8.0 ) * ( 1.0 + 0.12 * alpha ) / n;

      r3 = 1.0 + 0.012 * beta * ...
        ( 1.0 + 0.25 * abs ( alpha ) ) / n;

      xval = xval - r1 * r2 * r3 * ( 1.0 - xval );

    elseif ( i == 3 )

      r1 = ( 1.67 + 0.28 * alpha ) / ( 1.0 + 0.37 * alpha );

      r2 = 1.0 + 0.22 * ( n - 8.0 ) / n;

      r3 = 1.0 + 8.0 * beta / ( ( 6.28 + beta ) * n * n );

      xval = xval - r1 * r2 * r3 * ( x(1) - xval );

    elseif ( i < n - 1 )

      xval = 3.0 * x(i-1) - 3.0 * x(i-2) + x(i-3);

    elseif ( i == n - 1 )

      r1 = ( 1.0 + 0.235 * beta ) / ( 0.766 + 0.119 * beta );

      r2 = 1.0 / ( 1.0 + 0.639 * ( n - 4.0 ) ...
        / ( 1.0 + 0.71 * ( n - 4.0 ) ) );

      r3 = 1.0 / ( 1.0 + 20.0 * alpha / ( ( 7.5 + alpha ) * n * n ) );

      xval = xval + r1 * r2 * r3 * ( xval - x(i-2) );

    elseif ( i == n )

      r1 = ( 1.0 + 0.37 * beta ) / ( 1.67 + 0.28 * beta );

      r2 = 1.0 / ( 1.0 + 0.22 * ( n - 8.0 ) / n );

      r3 = 1.0 / ( 1.0 + 8.0 * alpha / ( ( 6.28 + alpha ) * n * n ) );

      xval = xval + r1 * r2 * r3 * ( xval - x(i-2) );

    end

    [ xval, dp2, p1 ] = jacobi_ss_root ( xval, n, alpha, beta, b, c );

    x(i) = xval;
    w(i) = cc / ( dp2 * p1 );

  end
%
%  Reverse the order of the values.
%
  x = r8vec_reverse ( n, x );
  w = r8vec_reverse ( n, w );

  return
end
