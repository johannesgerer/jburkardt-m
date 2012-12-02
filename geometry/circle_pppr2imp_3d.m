function [ pc, normal ] = circle_pppr2imp_3d ( p1, p2, p3, r )

%*****************************************************************************80
%
%% CIRCLE_PPR2IMP_3D converts a circle from PPR to implicit form in 3D.
%
%  Discussion:
%
%    The PPPR form of a circle in 3D is:
%
%      The circle of radius R passing through points P1 and P2,
%      and lying in the plane of P1, P2 and P3.
%
%    The implicit form of a circle in 3D is:
%
%      ( P(1) - PC(1) )**2 + ( P(2) - PC(2) )**2 + ( P(3) - PC(3) )**2 = R**2
%      and the dot product of P - PC with NORMAL is 0.
%
%    There may be zero, one, or two circles that satisfy the
%    requirements of the PPPR form.
%
%    If there is no such circle, then PC(1:2,1) and PC(1:2,2)
%    are set to the midpoint of (P1,P2).
%
%    If there is one circle, PC(1:2,1) and PC(1:2,2) will be equal.
%
%    If there are two circles, then PC(1:2,1) is the first center,
%    and PC(1:2,2) is the second.
%
%    This calculation is equivalent to finding the intersections of
%    spheres of radius R at points P1 and P2, which lie in the plane
%    defined by P1, P2 and P3.
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
%    Input, real P1(3,1), P2(3,1), two points on the circle.
%
%    Input, real P3(3,1), a third point.
%
%    Input, real R, the radius of the circle.
%
%    Output, real PC(3,2), the centers of the two circles.
%
%    Output, real NORMAL(3,1), the normal to the circles.
%
  dim_num = 3;
%
%  Compute the distance from P1 to P2.
%
  dist = sqrt ( sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 ) );
%
%  If R is smaller than DIST, we don't have a circle.
%
  if ( 2.0 * r < dist )
    for j = 1 : 2
      pc(1:dim_num,j) = 0.5 * ( p1(1:dim_num,1) + p2(1:dim_num,1) );
    end
    return
  end
%
%  H is the distance from the midpoint of (P1,P2) to the center.
%
  h = sqrt ( ( r + 0.5 * dist ) * ( r - 0.5 * dist ) );
%
%  Define a unit direction V that is normal to P2-P1, and lying
%  in the plane (P1,P2,P3).
%
%  To do this, subtract from P3-P1 the component in the direction P2-P1.
%
  v(1:dim_num,1) = p3(1:dim_num,1) - p1(1:dim_num,1);
  dot = v(1:dim_num,1)' * ( p2(1:dim_num,1) - p1(1:dim_num,1) );
  dot = dot / dist;

  v(1:dim_num,1) = v(1:dim_num,1) - dot * ( p2(1:dim_num,1) - p1(1:dim_num,1) ) / dist;

  v_length = sqrt ( sum ( v(1:dim_num,1).^2 ) );

  v(1:dim_num,1) = v(1:dim_num,1) / v_length;
%
%  We can go with or against the given normal direction.
%
  pc(1:dim_num,1) = 0.5 * ( p2(1:dim_num,1) + p1(1:dim_num,1) ) + h * v(1:dim_num,1);

  pc(1:dim_num,2) = 0.5 * ( p2(1:dim_num,1) + p1(1:dim_num,1) ) - h * v(1:dim_num,1);

  normal = plane_exp_normal_3d ( p1, p2, p3 );

  return
end
