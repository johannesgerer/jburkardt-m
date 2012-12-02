function turn = angle_turn_2d ( p1, p2, p3 )

%*****************************************************************************80
%
%% ANGLE_TURN_2D computes a turning angle in 2D.
%
%  Discussion:
%
%    This routine is most useful when considering the vertices of a
%    polygonal shape.  We wish to distinguish between angles that "turn
%    in" to the shape, (between 0 and 180 degrees) and angles that
%    "turn out" (between 180 and 360 degrees), as we traverse the boundary.
%
%    If we compute the interior angle and subtract 180 degrees, we get the
%    supplementary angle, which has the nice property that it is
%    negative for "in" angles and positive for "out" angles, and is zero if
%    the three points actually lie along a line.
%
%    Assuming P1, P2 and P3 define an angle, the TURN can be
%    defined to be either:
%
%    * the supplementary angle to the angle formed by P1=P2=P3, or
%
%    * the angle between the vector ( P3-P2) and the vector -(P1-P2),
%      where -(P1-P2) can be understood as the vector that continues
%      through P2 from the direction P1.
%
%    The turning will be zero if P1, P2 and P3 lie along a straight line.
%
%    It will be a positive angle if the turn from the previous direction
%    is counterclockwise, and negative if it is clockwise.
%
%    The turn is given in radians, and will lie between -PI and PI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), P3(2), the points that form
%    the angle.
%
%    Output, real TURN, the turn angle, between -PI and PI.
%
  p(1) = ( p3(1) - p2(1) ) * ( p1(1) - p2(1) ) ...
       + ( p3(2) - p2(2) ) * ( p1(2) - p2(2) );

  p(2) = ( p3(1) - p2(1) ) * ( p1(2) - p2(2) ) ...
       - ( p3(2) - p2(2) ) * ( p1(1) - p2(1) );

  if ( p(1) == 0.0 & p(2) == 0.0 )
    turn = 0.0;
  else
    turn = pi - r8_atan ( p(2), p(1) );
  end

  return
end
