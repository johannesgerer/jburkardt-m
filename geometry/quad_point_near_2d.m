function [ pn, dist ] = quad_point_near_2d ( q, p )

%*****************************************************************************80
%
%% QUAD_POINT_NEAR_2D computes the nearest point on a quadrilateral in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Q(2,4), the quadrilateral vertices.
%
%    Input, real P(2), the point whose nearest quadrilateral point
%    is to be determined.
%
%    Output, real PN(2), the nearest point to P.
%
%    Output, real DIST, the distance from the point to the
%    quadrilateral.
%
  dim_num = 2;
  nside = 4;
%
%  Find the distance to each of the line segments that make up the edges
%  of the quadrilateral.
%
  dist = Inf;
  pn(1:dim_num) = 0.0;

  for j = 1 : nside

    jp1 = i4_wrap ( j+1, 1, nside );

    [ pn2, dist2, tval ] = segment_point_near_2d ( q(1:dim_num,j)', ...
      q(1:dim_num,jp1)', p );

    if ( dist2 < dist )
      dist = dist2;
      pn(1:dim_num) = pn2(1:dim_num);
    end

  end

  return
end
