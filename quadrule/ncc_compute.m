function [ x, w ] = ncc_compute ( n )

%*****************************************************************************80
%
%% NCC_COMPUTE computes a Newton-Cotes Closed quadrature rule.
%
%  Discussion:
%
%    For the interval [-1,+1], the Newton-Cotes Closed quadrature rule
%    estimates
%
%      Integral ( -1 <= X <= +1 ) F(X) dX
%
%    using N abscissas X and weights W:
%
%      sum ( 1 <= I <= N ) W(I) * F ( X(I) ).
%
%    For the CLOSED rule, the abscissas are equally spaced, and include
%    the end points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2009
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
  x = ncc_compute_points ( n );

  w = ncc_compute_weights ( n );

  return
end
