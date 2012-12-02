function [ x, w ] = laguerre_ss_compute ( n )

%*****************************************************************************80
%
%% LAGUERRE_SS_COMPUTE computes a Gauss-Laguerre quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( 0 <= X < +oo ) EXP ( - X ) * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    The integral:
%
%      Integral ( 0 <= X < +oo ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * EXP ( X(I) ) * F ( X(I) )
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
%    Input, integer N, the order.
%    N must be at least 1.
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
  b = zeros ( n );
  for i = 1 : n
    b(i) = 2 * i - 1;
  end

  c = zeros ( n );
  for i = 1 : n
    c(i) = ( i - 1 ) * ( i - 1 );
  end

  cc = prod ( c(2:n) );

  for i = 1 : n
%
%  Compute an estimate for the root.
%
    if ( i == 1 )

      xval = 3.0 / ( 1.0 + 2.4 * n );

    elseif ( i == 2 )

      xval = xval + 15.0 / ( 1.0 + 2.5 * n );

    else

      r1 = ( 1.0 + 2.55 * ( i - 2 ) ) / ( 1.9 * ( i - 2 ) );

      xval = xval + r1 * ( xval - x(i-2) );

    end
%
%  Use iteration to find the root.
%
    [ xval, dp2, p1 ] = laguerre_ss_root ( xval, n, b, c );
%
%  Set the abscissa and weight.
%
    x(i) = xval;
    w(i) = ( cc / dp2 ) / p1;

  end

  return
end
