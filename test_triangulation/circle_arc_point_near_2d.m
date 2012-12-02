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
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2), the center of the circle.
%
%    Input, real THETA1, THETA2, the angles defining the arc,
%    in radians.  Normally, THETA1 < THETA2.
%
%    Input, real P(2), the point to be checked.
%
%    Output, real PN(2), a point on the circular arc which is
%    nearest to the point.
%
%    Output, real DIST, the distance to the nearest point.
%
  ndim = 2;
%
%  Special case, the zero circle.
%
  if ( r == 0.0 )
    pn(1:ndim) = center(1:ndim);
    dist = sqrt ( sum ( ( p(1:ndim) - pn(1:ndim) ).^2 ) );
    return
  end
%
%  Determine the angle made by the point.
%
  theta = atan4 ( p(2) - center(2), p(1) - center(1) );
%
%  If the angle is between THETA1 and THETA2, then you can
%  simply project the point onto the arc.
%
  if ( r8_modp ( theta  - theta1,  2.0 * pi ) <= ...
       r8_modp ( theta2 - theta1,  2.0 * pi ) ) 

    r2 = sqrt ( sum ( ( p(1:ndim) - center(1:ndim) ).^2 ) );

    pn(1:ndim) = center(1:ndim) + ( p(1:ndim) - center(1:ndim) ) * r / r2;
%
%  Otherwise, if the angle is less than the negative of the
%  average of THETA1 and THETA2, it's on the side of the arc
%  where the endpoint associated with THETA2 is closest.
%
%  As usual, MATLAB has some ninny problem with using cosine in a vector.
%  So I have to write the assignment as two scalar assignments.
%
  elseif ( r8_modp ( theta - 0.5 * ( theta1 + theta2 ), 2.0 * pi ) <= pi )

    pn(1) = center(1) + r * cos ( theta2 );
    pn(2) = center(2) + r * sin ( theta2 );
%
%  Otherwise, the endpoint associated with THETA1 is closest.
%
  else

    pn(1) = center(1) + r * cos ( theta1 );
    pn(2) = center(2) + r * sin ( theta1 );
    
  end

  dist = sqrt ( sum ( ( p(1:ndim) - pn(1:ndim) ).^2 ) );

  return
end
