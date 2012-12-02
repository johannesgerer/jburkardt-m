function [ pn, dist ] = polygon_point_near_2d ( n, v, p )

%*****************************************************************************80
%
%% POLYGON_POINT_NEAR_2D computes the nearest point on a polygon in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V(2,N), the polygon vertices.
%
%    Input, real P(2), the point whose nearest polygon point
%    is to be determined.
%
%    Output, real PN(2), the nearest point to P.
%
%    Output, real DIST, the distance from the point to the
%    polygon.
%
  dim_num = 2;
%
%  Find the distance to each of the line segments that make up the edges
%  of the polygon.
%
  dist = r8_huge ( );
  pn(1:dim_num) = 0.0;

  for j = 1 : n

    jp1 = i4_wrap ( j+1, 1, n );

    [ pn2, dist2, tval ] = ...
      segment_point_near_2d ( v(1:dim_num,j)', v(1:dim_num,jp1)', p );

    if ( dist2 < dist )
      dist = dist2;
      pn(1:dim_num) = pn2(1:dim_num);
    end

  end

  return
end
