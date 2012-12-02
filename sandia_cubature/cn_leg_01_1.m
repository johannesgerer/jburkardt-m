function [ o, x, w ] = cn_leg_01_1 ( n )

%*****************************************************************************80
%
%% CN_LEG_01_1 implements the midpoint rule for region CN_LEG.
%
%  Discussion:
%
%    The rule has order O = 1.
%
%    The rule has precision P = 1.
%
%    CN_LEG is the cube [-1,+1]^N with the Legendre weight function
%
%      w(x) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2010
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
  value1 = c1_leg_monomial_integral ( expon );
  volume = value1 ^ n;

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  1 point.
%
  k = k + 1;
  w(k) = volume;

  return
end
