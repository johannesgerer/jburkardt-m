function [ w, t ] = circle_rule ( nt )

%*****************************************************************************80
%
%% CIRCLE_RULE computes a quadrature rule for the unit circle.
%
%  Discussion:
%
%    The unit circle is the region:
%
%      x * x + y * y = 1.
%
%    The integral I(f) is then approximated by
%
%      Q(f) = 2 * pi * sum ( 1 <= i <= NT ) W(i) * F ( cos(T(i)), sin(T(i)) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, the number of angles to use.
%
%    Output, real W(NT), the weights for the rule.
%
%    Output, real T(NT), the angles for the rule.
%
  w(1:nt) = 1.0 / nt;
  for it = 1 : nt
    t(it) = 2.0 * pi * ( it - 1 ) / nt;
  end

  return
end
