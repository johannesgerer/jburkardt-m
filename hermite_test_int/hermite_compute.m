function [ xtab, weight ] = hermite_compute ( order )

%*****************************************************************************80
%
%% HERMITE_COMPUTE computes a Gauss-Hermite quadrature rule.
%
%  Discussion:
%
%    The abscissas are the zeros of the N-th order Hermite polynomial.
%
%    The integration interval is ( -oo, +oo ).
%
%    The weight function is w(x) = exp ( - x^2 );
%
%    The integral to approximate:
%
%      Integral ( -oo < X < +oo ) exp ( - X^2 ) * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= ORDER ) WEIGHT(I) * F ( XTAB(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2010
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
%    Input, integer ORDER, the order of the formula to be computed.
%
%    Output, real XTAB(ORDER), the Gauss-Hermite abscissas.
%
%    Output, real WEIGHT(ORDER), the Gauss-Hermite weights.
%
  xtab = zeros ( order, 1 );
  weight = zeros ( order, 1 );

  cc = 1.7724538509 * gamma ( order ) / ( 2.0^( order - 1 ) );

  s = ( 2.0 * order + 1.0 )^( 1.0 / 6.0 );

  for i = 1 : floor ( ( order + 1 ) / 2 )

    if ( i == 1 )

      x = s^3 - 1.85575 / s;

    elseif ( i == 2 )

      x = x - 1.14 * ( ( order )^0.426 ) / x;

    elseif ( i == 3 )

      x = 1.86 * x - 0.86 * xtab(1);

    elseif ( i == 4 )

      x = 1.91 * x - 0.91 * xtab(2);

    else

      x = 2.0 * x - xtab(i-2);

    end

    [ x, dp2, p1 ] = hermite_root ( x, order );

    xtab(i) = x;
    weight(i) = ( cc / dp2 ) / p1;

    xtab(order-i+1) = - x;
    weight(order-i+1) = weight(i);

  end
%
%  Reverse the order of the XTAB values.
%
  for i = 1 : floor ( order / 2 )
    temp            = xtab(i);
    xtab(i)         = xtab(order+1-i);
    xtab(order+1-i) = temp;
  end

  return
end
