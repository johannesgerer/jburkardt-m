function [ x, w ] = hermite_ss_compute ( order )

%*****************************************************************************80
%
%% HERMITE_SS_COMPUTE computes a Hermite quadrature rule.
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
%      Sum ( 1 <= I <= ORDER ) W(I) * F ( X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2011
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
%    Output, real X(ORDER), the abscissas.
%
%    Output, real W(ORDER), the weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HERMITE_SS_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'HERMITE_SS_COMPUTE - Fatal error!' );
  end

  x = zeros ( order, 1 );
  w = zeros ( order, 1 );

  cc = 1.7724538509 * gamma ( order ) / ( 2.0^( order - 1 ) );

  s = ( 2.0 * order + 1.0 )^( 1.0 / 6.0 );

  for i = 1 : floor ( ( order + 1 ) / 2 )

    if ( i == 1 )

      x0 = s^3 - 1.85575 / s;

    elseif ( i == 2 )

      x0 = x0 - 1.14 * ( ( order )^0.426 ) / x0;

    elseif ( i == 3 )

      x0 = 1.86 * x0 - 0.86 * x(1);

    elseif ( i == 4 )

      x0 = 1.91 * x0 - 0.91 * x(2);

    else

      x0 = 2.0 * x0 - x(i-2);

    end

    [ x0, dp2, p1 ] = hermite_ss_root ( x0, order );

    x(i) = x0;
    w(i) = ( cc / dp2 ) / p1;

    x(order-i+1) = - x0;
    w(order-i+1) = w(i);

  end
%
%  Reverse the order.
%
  x(1:order) = x(order:-1:1);

  return
end
