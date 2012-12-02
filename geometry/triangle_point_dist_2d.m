function dist = triangle_point_dist_2d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_POINT_DIST_2D: distance ( triangle, point ) in 2D.
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
%    Input, real P(2,1), the point to be checked.
%
%    Output, real DIST, the distance from the point to the
%    triangle.
%
  nside = 3;
%
%  Find the distance to each of the line segments.
%
  dist = Inf;

  for j = 1 : nside

    jp1 = i4_wrap ( j + 1, 1, nside );

    dist2 = segment_point_dist_2d ( t(1:2,j), t(1:2,jp1), p );

    if ( dist2 < dist )
      dist = dist2;
    end

  end

  return
end
