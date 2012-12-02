function dist = circle_imp_point_dist_2d ( r, center, p )

%*****************************************************************************80
%
%% CIRCLE_IMP_POINT_DIST_2D: distance ( implicit circle, point ) in 2D.
%
%  Discussion:
%
%    The distance is zero if the point is on the circle.
%
%    An implicit circle in 2D satisfies the equation:
%
%      ( X - CENTER(1) )**2 + ( Y - CENTER(2) )**2 = R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
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
%    Input, real P(2,1), the point to be checked.
%
%    Output, real DIST, the distance of the point to the circle.
%
  dim_num = 2;

  r2 = sqrt ( sum ( ( p(1:2,1) - center(1:2,1) ).^2 ) );

  dist = abs ( r2 - r );

  return
end
