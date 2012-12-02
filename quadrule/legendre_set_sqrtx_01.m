function [ x, w ] = legendre_set_sqrtx_01 ( n )

%*****************************************************************************80
%
%% LEGENDRE_SET_SQRTX_01 sets a Gauss-Legendre rule for SQRT(X) * F(X) on [0,1].
%
%  Discussion:
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) SQRT ( X ) * F(X) dX =
%      Integral ( 0 <= Y <= 1 ) 2 * Y**2 * F(Y**2) dY.
%      (using Y = SQRT(X) )
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
%    02 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    CRC Press, 30th Edition, 2000, page 696.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  n2 = 2 * n + 1;

  [ x2, w2 ] = legendre_set ( n2 );

  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  x(1:n,1) = x2(n+2:2*n+1,1).^2;

  w(1:n,1) = 2.0 * w2(n+2:2*n+1,1) .* x(1:n,1);

  return
end
