function [ pn, dist, t ] = segment_point_near_2d ( p1, p2, p )

%*****************************************************************************80
%
%% SEGMENT_POINT_NEAR_2D finds the line segment point nearest a point in 2D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%    The nearest point will satisfy the condition
%
%      PN = (1-T) * P1 + T * P2.
%
%    T will always be between 0 and 1.
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
%    Input, real P1(2), P2(2), the endpoints of the line segment.
%
%    Input, real P(2), the point whose nearest neighbor
%    on the line segment is to be determined.
%
%    Output, real PN(2), the point on the line segment which is
%    nearest the point (X,Y).
%
%    Output, real DIST, the distance from the point to the
%    nearest point on the line segment.
%
%    Output, real T, the relative position of the point (XN,YN)
%    to the points (X1,Y1) and (X2,Y2).
%
  ndim = 2;

  if ( p1(1:ndim) == p2(1:ndim) )

    t = 0.0;
    pn(1:ndim) = p1(1:ndim);

  else

    bot = sum ( ( p2(1:ndim) - p1(1:ndim) ).^2 );

    t = sum ( ( p1(1:ndim) - p(1:ndim) ) .* ( p1(1:ndim) - p2(1:ndim) ) ) / bot;

    if ( t < 0.0 )
      t = 0.0;
      pn(1:ndim) = p1(1:ndim);
    elseif ( 1.0 < t )
      t = 1.0;
      pn(1:ndim) = p2(1:ndim);
    else
      pn(1:ndim) = p1(1:ndim) + t * ( p2(1:ndim) - p1(1:ndim) );
    end

  end

  dist = sqrt ( sum ( ( p(1:ndim) - pn(1:ndim) ).^2 ) );

  return
end
