function dist = shape_point_dist_2d ( center, p1, nside, p )

%*****************************************************************************80
%
%% SHAPE_POINT_DIST_2D: distance ( regular shape, point ) in 2D.
%
%  Discussion:
%
%    The "regular shape" is assumed to be an equilateral and equiangular
%    polygon, such as the standard square, pentagon, hexagon, and so on.
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
%    Input, real CENTER(2,1), the center of the shape.
%
%    Input, real P1(2,1), the first vertex of the shape.
%
%    Input, integer NSIDE, the number of sides in the shape.
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, real DIST, the distance from the point to the shape.
%

%
%  Determine the angle subtended by a single side.
%
  sector_angle = 360.0 / nside;
%
%  How long is the half-diagonal?
%
  radius = sqrt ( sum ( ( p1(1:2,1) - center(1:2,1) ).^2 ) );
%
%  If the radius is zero, then the shape is a point and the computation is easy.
%
  if ( radius == 0.0 )
    dist = sqrt ( sum ( ( p(1:2,1) - center(1:2,1) ).^2 ) );
    return;
  end
%
%  If the test point is at the center, then the computation is easy.
%  The angle subtended by any side is ( 2 * PI / NSIDE ) and the
%  nearest distance is the midpoint of any such side.
%
  if ( sqrt ( sum ( ( p1(1:2,1) - center(1:2,1) ).^2 ) ) == 0.0 )
    dist = radius * cos ( pi / nside );
    return
  end
%
%  Determine the angle between the ray to the first corner,
%  and the ray to the test point.
%
  angle = angle_deg_2d ( p1, center, p );
%
%  Determine the sector of the point.
%
  sector_index = floor ( angle / sector_angle ) + 1;
%
%  Generate the two corner points that terminate the SECTOR-th side.
%
  angle2 = ( sector_index - 1 ) * sector_angle;
  angle2 = degrees_to_radians ( angle2 );

  pa = vector_rotate_base_2d ( p1, center, angle2 );

  angle2 = ( sector_index ) * sector_angle;
  angle2 = degrees_to_radians ( angle2 );

  pb = vector_rotate_base_2d ( p1, center, angle2 );
%
%  Determine the distance from the test point to the line segment that
%  is the SECTOR-th side.
%
  dist = segment_point_dist_2d ( pa, pb, p );

  return
end
