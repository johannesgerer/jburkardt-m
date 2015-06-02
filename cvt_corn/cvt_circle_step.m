function p_xy = cvt_circle_step ( r, np, p_xy, p_type )

%*****************************************************************************80
%
%% CVT_CIRCLE_STEP applies one step of the CVT algorithm to points on a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, integer NP, the number of points.
%
%    Input, real P_XY(2,NP), the point coordinates.
%
%    Input, integer P_TYPE(NP),
%    1, the point is constrained to the circle.
%    2, the point is constrainted to the disk.
%
%    Output, real P_XY(2,NP), the updated point coordinates.
%

%
%  Rearrange the points so the circle points come first.
%
  circle = find ( p_type == 1 );
  disk = find ( p_type == 2 );
  p_xy = [ p_xy(:,circle), p_xy(:,disk) ];
%
%  Determine the angle of all the circle points.
%
  nc = length ( circle );
  angle(1,1:nc) = atan2 ( p_xy(2,1:nc), p_xy(1,1:nc) );
%
%  Sort the circle points by angle.
%
  [ angle, key ] = sort ( angle(1,1:nc) );
  p_xy(1,1:nc) = p_xy(1,key(1:nc));
  p_xy(2,1:nc) = p_xy(2,key(1:nc));
%
%  Compute the angle of the constrained centroids.
%
  angle_c = zeros ( 1, nc );
  angle_c(1,1)      = 0.25 * angle(1,nc)     + 0.5 * angle(1,1)      + 0.25 * angle(1,2) - 0.5 * pi;
  angle_c(1,2:nc-1) = 0.25 * angle(1:1:nc-2) + 0.5 * angle(1,2:nc-1) + 0.25 * angle(3:nc);
  angle_c(1,nc)     = 0.25 * angle(1,nc-1)   + 0.5 * angle(1,nc)     + 0.25 * angle(1)   + 0.5 * pi;
%
%  Update the positions of circle points.
%
  p_xy(1,1:nc) = r * cos ( angle_c(1,1:nc) );
  p_xy(2,1:nc) = r * sin ( angle_c(1,1:nc) );

  return
end

