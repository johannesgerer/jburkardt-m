function [ xtab, weight ] = laguerre_compute ( norder, alpha )

%*****************************************************************************80
%
%% LAGUERRE_COMPUTE computes a Gauss-Laguerre quadrature rule.
%
%  Discussion:
%
%    In the simplest case, ALPHA is 0, and we are approximating the
%    integral from 0 to +oo of EXP(-X) * F(X).  When this is so,
%    it is easy to modify the rule to approximate the integral from
%    A to +oo as well.
%
%    If ALPHA is nonzero, then there is no simple way to extend the
%    rule to approximate the integral from A to +oo.  The simplest
%    procedures would be to approximate the integral from 0 to A.
%
%    The integration interval is [ A, +oo ) or [ 0, +oo ).
%
%    The weight function w(x) = EXP ( - X ) or EXP ( - X ) * X^ALPHA.
%
%
%    If the integral to approximate is:
%
%        Integral ( A <= X < +oo ) EXP ( - X ) * F(X) dX
%      or
%        Integral ( 0 <= X < +oo ) EXP ( - X ) * X^ALPHA * F(X) dX
%
%    then the quadrature rule is:
%
%      EXP ( - A ) * Sum ( 1 <= I <= ORDER ) WEIGHT(I) * F ( A+XTAB(I) )
%    or
%      sum ( 1 <= I <= ORDER ) WEIGHT(I) * F ( XTAB(I) )
%
%
%    If the integral to approximate is:
%
%        Integral ( A <= X < +oo ) F(X) dX
%      or
%        Integral ( 0 <= X < +oo ) X^ALPHA * F(X) dX
%
%    then the quadrature rule is:
%
%      EXP ( - A ) * sum ( 1 <= I <= ORDER ) 
%        WEIGHT(I) * EXP(A+XTAB(I)) * F ( A+XTAB(I) )
%    or
%      sum ( 1 <= I <= ORDER ) WEIGHT(I) * EXP(XTAB(I)) * F ( XTAB(I) )
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
%    Input, integer NORDER, the order of the quadrature rule to be computed.
%    NORDER must be at least 1.
%
%    Input, real ALPHA, the exponent of the X factor.
%    Set ALPHA = 0.0 for the simplest rule.
%    ALPHA must be nonnegative.
%
%    Output, real XTAB(NORDER), the Gauss-Laguerre abscissas.
%
%    Output, real WEIGHT(NORDER), the Gauss-Laguerre weights.
%

%
%  Set the recursion coefficients.
%
  for i = 1 : norder
    b(i) = ( alpha + 2 * i - 1 );
  end

  for i = 1 : norder
    c(i) = ( i - 1 ) * ( alpha + i - 1 );
  end

  cc = gamma ( alpha + 1.0 ) * prod ( c(2:norder) );

  for i = 1 : norder
%
%  Compute an estimate for the root.
%
    if ( i == 1 )

      x = ( 1.0 + alpha ) * ( 3.0 + 0.92 * alpha ) ...
        / ( 1.0 + 2.4 * norder + 1.8 * alpha );

    elseif ( i == 2 )

      x = x + ( 15.0 + 6.25 * alpha ) ...
        / ( 1.0 + 0.9 * alpha + 2.5 * norder );

    else

      r1 = ( 1.0 + 2.55 * ( i - 2 ) ) / ( 1.9 * ( i - 2 ) );

      r2 = 1.26 * ( i - 2 ) * alpha / ( 1.0 + 3.5 * ( i - 2 ) );

      ratio = ( r1 + r2 ) / ( 1.0 + 0.3 * alpha );

      x = x + ratio * ( x - xtab(i-2) );

    end
%
%  Use iteration to find the root.
%
    [ x, dp2, p1 ] = laguerre_root ( x, norder, alpha, b, c );
%
%  Set the abscissa and weight.
%
    xtab(i) = x;
    weight(i) = ( cc / dp2 ) / p1;

  end

  return
end
