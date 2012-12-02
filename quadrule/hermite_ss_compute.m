function [ x, w ] = hermite_ss_compute ( n )

%*****************************************************************************80
%
%% HERMITE_SS_COMPUTE computes a Gauss-Hermite quadrature rule.
%
%  Discussion:
%
%    The abscissas are the zeros of the N-th order Hermite polynomial.
%
%    The integral:
%
%      Integral ( -oo < X < +oo ) exp ( - x * x ) * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
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
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  cc = sqrt ( pi ) * gamma ( n ) / ( 2.0^( n - 1 ) );

  s = ( 2.0 * n + 1.0 )^( 1.0 / 6.0 );

  for i = 1 : floor ( ( n + 1 ) / 2 )

    if ( i == 1 )

      xval = s * s * s - 1.85575 / s;

    elseif ( i == 2 )

      xval = xval - 1.14 * ( ( n )^0.426 ) / xval;

    elseif ( i == 3 )

      xval = 1.86 * xval - 0.86 * x(1);

    elseif ( i == 4 )

      xval = 1.91 * xval - 0.91 * x(2);

    else

      xval = 2.0 * xval - x(i-2);

    end

    [ xval, dp2, p1 ] = hermite_ss_root ( xval, n );

    x(i) = xval;
    w(i) = ( cc / dp2 ) / p1;

    x(n-i+1) = - xval;
    w(n-i+1) = w(i);

  end
%
%  Reverse the order.
%
  x(1:n) = x(n:-1:1);

  return
end
