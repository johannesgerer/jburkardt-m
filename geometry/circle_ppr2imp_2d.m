function pc = circle_ppr2imp_2d ( p1, p2, r )

%*****************************************************************************80
%
%% CIRCLE_PPR2IMP_2D converts a circle from PPR to implicit form in 2D.
%
%  Discussion:
%
%    The PPR form of a circle in 2D is:
%
%      The circle of radius R passing through points P1 and P2.
%
%    The implicit form of a circle in 2D is:
%
%      ( P(1) - PC(1) )**2 + ( P(2) - PC(2) )**2 = R**2
%
%    There may be zero, one, or two circles that satisfy the
%    requirements of the PPR form.
%
%    If there is no such circle, then PC(1:2,1) and PC(1:2,2)
%    are set to the midpoint of (P1,P2).
%
%    If there is one circle, PC(1:2,1) and PC(1:2,2) will be equal.
%
%    If there are two circles, then PC(1:2,1) is the first center,
%    and PC(1:2,2) is the second.
%
%    This calculation is equivalent to finding the intersection of
%    circles of radius R at points P1 and P2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), two points on the circle.
%
%    Input, real R, the radius of the circle.
%
%    Output, real PC(2,2), the centers of the two circles.
%
  dim_num = 2;
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
%  The center is found by going midway between P1 and P2, and then
%  H units in the unit perpendicular direction.
%
%  We actually have two choices for the normal direction.
%
  pc(1,1) = 0.5 * ( p2(1,1) + p1(1,1) ) + h * ( p2(2,1) - p1(2,1) ) / dist;
  pc(2,1) = 0.5 * ( p2(2,1) + p1(2,1) ) - h * ( p2(1,1) - p1(1,1) ) / dist;

  pc(1,2) = 0.5 * ( p2(1,1) + p1(1,1) ) - h * ( p2(2,1) - p1(2,1) ) / dist;
  pc(2,2) = 0.5 * ( p2(2,1) + p1(2,1) ) + h * ( p2(1,1) - p1(1,1) ) / dist;

  return
end
