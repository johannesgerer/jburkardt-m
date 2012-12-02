function inside = angle_contains_point_2d ( p1, p2, p3, p )

%*****************************************************************************80
%
%% ANGLE_CONTAINS_POINT_2D determines if an angle contains a point, in 2D.
%
%  Discussion:
%
%    The angle is defined by the sequence of points P1, P2 and P3.
%
%    The point is "contained" by the angle if the ray P - P2
%    is between (in a counterclockwise sense) the rays P1 - P2
%    and P3 - P2.
%
%        P1
%        /
%       /   P
%      /  .  
%     / .
%    P2--------->P3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), P3(2), the coordinates of
%    three points that define the angle.  The order of these points matters!
%
%    Input, real P(2), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is inside the angle.
%
  if ( angle_rad_2d ( p1, p2, p ) <= angle_rad_2d ( p1, p2, p3 ) )
    inside = 1;
  else
    inside = 0;
  end

  return
end
