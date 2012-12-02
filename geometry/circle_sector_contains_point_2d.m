function inside = circle_sector_contains_point_2d ( r, center, theta1, theta2, p )

%*****************************************************************************80
%
%% CIRCLE_SECTOR_CONTAINS_POINT_2D : is a point inside a circular sector?
%
%  Discussion:
%
%    A circular sector is formed by a circular arc, and the two straight line
%    segments that join its ends to the center of the circle.
%
%    A circular sector is defined by
%
%      ( X - CENTER(1) )**2 + ( Y - CENTER(2) )**2 = R**2
%
%    and
%
%      Theta1 <= Theta <= Theta2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2,1), the center of the circle.
%
%    Input, real THETA1, THETA2, the angles defining the arc,
%    in radians.  Normally, THETA1 < THETA2.
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is inside or on the
%    circular sector, FALSE otherwise.
%
  inside = 0;
%
%  Is the point inside the (full) circle?
%
  if ( ( p(1,1) - center(1,1) ) * ( p(1,1) - center(1,1) ) ...
     + ( p(2,1) - center(2,1) ) * ( p(2,1) - center(2,1) ) <= r * r )
%
%  Is the point's angle within the arc's range?
%  Try to force the angles to lie between 0 and 2 * PI.
%
    theta = r8_atan ( p(2,1) - center(2,1), p(1,1) - center(1,1) );

    if ( r8_modp ( theta  - theta1,  2.0 * pi ) <= ...
         r8_modp ( theta2 - theta1,  2.0 * pi ) )

      inside = 1;

    end

  end

  return
end
