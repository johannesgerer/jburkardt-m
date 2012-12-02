function [ o, x, w ] = epn_lag_00_1 ( n )

%*****************************************************************************80
%
%% EPN_LAG_00_1 implements the "midpoint rule" for region EPN_LAG.
%
%  Discussion:
%
%    The rule has order O = 1.
%
%    The rule has precision P = 0.
%
%    EPN is the N-dimensional positive space [0,+oo)^N with exponential
%    or Laguerre weight function:
%
%      w(x(1:n)) = exp ( - sum ( x(1:n) ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 1;

  expon = 0;
  volume = ep1_lag_monomial_integral ( expon);
  volume = volume ^ n;

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  1 point.
%
  k = k + 1;
  x(1:n,k) = 1.0;
  w(k) = volume;

  return
end
