function [ x, w ] = legendre_set_sqrtx2_01 ( n )

%*****************************************************************************80
%
%% LEGENDRE_SET_SQRTX2_01 sets a Gauss-Legendre rule for F(X) / SQRT(X) on [0,1].
%
%  Discussion:
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) F(X) / SQRT ( X ) dX
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
%    13 October 2005
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

  x(1:n) = x2(n+2:2*n+1).^2;

  w(1:n) = 2.0 * w2(n+2:2*n+1);

  return
end
