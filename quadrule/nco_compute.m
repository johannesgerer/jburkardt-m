function [ x, w ] = nco_compute ( n )

%*****************************************************************************80
%
%% NCO_COMPUTE computes a Newton-Cotes Open quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= +1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) ).
%
%    For the OPEN rule, the abscissas do not include the end points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = nco_compute_points ( n );

  w = nco_compute_weights ( n );

  return
end
