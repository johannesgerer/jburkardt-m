function [ pn, dist ] = circle_arc_point_near_2d ( r, center, theta1, ...
  theta2, p )

%*****************************************************************************80
%
%% CIRCLE_ARC_POINT_NEAR_2D : nearest point on a circular arc.
%
%  Discussion:
%
%    A circular arc is defined by the portion of a circle (R,C)
%    between two angles (THETA1,THETA2).
%
%    Thus, a point (X,Y) on a circular arc satisfies
%
%      ( X - C(1) ) * ( X - C(1) ) + ( Y - C(2) ) * ( Y - C(2) ) = R * R
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
%    09 January 2005
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
%    Output, real PN(2,1), a point on the circular arc which is
%    nearest to the point.
%
%    Output, real DIST, the distance to the nearest point.
%
  dim_num = 2;
%
%  Special case, the zero circle.
%
  if ( r == 0.0 )
    pn(1:dim_num,1) = center(1:dim_num,1);
    dist = sqrt ( sum ( ( p(1:dim_num,1) - pn(1:dim_num,1) ).^2 ) );
    return
  end
%
%  Determine the angle made by the point.
%
  theta = atan4 ( p(2,1) - center(2,1), p(1,1) - center(1,1) );
%
%  If the angle is between THETA1 and THETA2, then you can
%  simply project the point onto the arc.
%
  if ( r8_modp ( theta  - theta1,  2.0 * pi ) <= ...
       r8_modp ( theta2 - theta1,  2.0 * pi ) )

    r2 = sqrt ( sum ( ( p(1:dim_num,1) - center(1:dim_num,1) ).^2 ) );

    pn(1:dim_num,1) = center(1:dim_num,1) ...
      + ( p(1:dim_num,1) - center(1:dim_num,1) ) * r / r2;
%
%  Otherwise, if the angle is less than the negative of the
%  average of THETA1 and THETA2, it's on the side of the arc
%  where the endpoint associated with THETA2 is closest.
%
  elseif ( r8_modp ( theta - 0.5 * ( theta1 + theta2 ), 2.0 * pi ) <= pi )

    pn(1:dim_num,1) = center(1:dim_num,1) + r * [ cos ( theta2 ), sin ( theta2 ) ];
%
%  Otherwise, the endpoint associated with THETA1 is closest.
  else

    pn(1:dim_num,1) = center(1:dim_num,1) + r * [ cos ( theta1 ), sin ( theta1 ) ];

  end

  dist = sqrt ( sum ( ( p(1:dim_num,1) - pn(1:dim_num,1) ).^2 ) );

  return
end
