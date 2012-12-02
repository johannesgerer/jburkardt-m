function [ pn, dist ] = triangle_point_near_2d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_POINT_NEAR_2D computes the nearest point on a triangle in 2D.
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
%    Input, real T(2,3), the triangle vertices.
%
%    Input, real P(2,1), the point whose nearest triangle point
%    is to be determined.
%
%    Output, real PN(2,1), the nearest point to P.
%
%    Output, real DIST, the distance from the point to the
%    triangle.
%
  nside = 3;
%
%  Find the distance to each of the line segments that make up the edges
%  of the triangle.
%
  dist = Inf;
  pn(1:2,1) = 0.0;

  for j = 1 : nside

    jp1 = i4_wrap ( j + 1, 1, nside );

    [ pn2, dist2, tval ] = segment_point_near_2d ( t(1:2,j), ...
      t(1:2,jp1), p );

    if ( dist2 < dist )
      dist = dist2;
      pn(1:2,1) = pn2(1:2,1);
    end

  end

  return
end
