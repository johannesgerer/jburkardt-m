function [ pn, dist, t ] = segment_point_near_3d ( p1, p2, p )

%*****************************************************************************80
%
%% SEGMENT_POINT_NEAR_3D finds the point on a line segment nearest a point in 3D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), the endpoints of the segment.
%
%    Input, real P(3,1), the point whose nearest neighbor
%    on the line segment is to be determined.
%
%    Output, real PN(3,1), the point on the line segment
%    nearest to P.
%
%    Output, real DIST, the distance from the point to the
%    nearest point on the line segment.
%
%    Output, real T, the relative position of the nearest point
%    P to P1 and P2, that is PN = (1-T)*P1 + T*P2.
%

%
%  If the line segment is actually a point, then the answer is easy.
%
  if ( p1(1:3,1) == p2(1:3,1) )

    t = 0.0;

  else

    bot = sum ( ( p2(1:3,1) - p1(1:3,1) ).^2 );

    t = ( p(1:3,1) - p1(1:3,1) )' * ( p2(1:3,1) - p1(1:3,1) ) / bot;

    t = max ( t, 0.0 );
    t = min ( t, 1.0 );

  end

  pn(1:3,1) = p1(1:3,1) + t * ( p2(1:3,1) - p1(1:3,1) );

  dist = sqrt ( sum ( ( pn(1:3,1) - p(1:3,1) ).^2 ) );

  return
end
