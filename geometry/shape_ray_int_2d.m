function pi = shape_ray_int_2d ( center, p1, nside, pa, pb )

%*****************************************************************************80
%
%% SHAPE_RAY_INT_2D: intersection ( regular shape, ray ) in 2D.
%
%  Discussion:
%
%    The "regular shape" is assumed to be an equilateral and equiangular
%    polygon, such as the standard square, pentagon, hexagon, and so on.
%
%    The origin of the ray is assumed to be inside the shape.  This
%    guarantees that the ray will intersect the shape in exactly one point.
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
%    Input, real PA(2,1), the origin of the ray.
%
%    Input, real PB(2,1), a second point on the ray.
%
%    Output, real PI(2,1), the point on the shape intersected
%    by the ray.
%

%
%  Warning!
%  No check is made to ensure that the ray origin is inside the shape.
%  These calculations are not valid if that is not true!
%
%  Determine the angle subtended by a single side.
%
  sector_angle = 360.0 / nside;
%
%  How long is the half-diagonal?
%
  radius = sqrt ( sum ( ( p1(1:2,1) - center(1:2,1) ).^2 ) );
%
%  If the radius is zero, refuse to continue.
%
  if ( radius == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SHAPE_RAY_INT_2D - Fatal error!\n' );
    fprintf ( 1, '  The shape has radius zero.\n' );
    error ( 'SHAPE_RAY_INT_2D - Fatal error!' );
  end
%
%  Determine which sector side intersects the ray.
%
  v2(1:2,1) = [ 0.0; 0.0 ];

  for sector_index = 1 : nside
%
%  Determine the two vertices that define this sector.
%
    if ( sector_index == 1 )

      angle2 = ( sector_index - 1 ) * sector_angle;
      angle2 = degrees_to_radians ( angle2 );

      v1 = vector_rotate_base_2d ( p1, center, angle2 );

    else

      v1(1:2,1) = v2(1:2,1);

    end

    angle2 = ( sector_index ) * sector_angle;
    angle2 = degrees_to_radians ( angle2 );

    v2 = vector_rotate_base_2d ( p1, center, angle2 );
%
%  Draw the angle from one vertex to the ray origin to the next vertex,
%  and see if that angle contains the ray.  If so, then the ray
%  must intersect the shape side of that sector.
%
    inside = angle_contains_point_2d ( v1, pa, v2, pb );

    if ( inside )
%
%  Determine the intersection of the lines defined by the ray and the
%  sector side.  (We're already convinced that the ray and sector line
%  segment intersect, so we can use the simpler code that treats them
%  as full lines).
%
      [ ival, pi ] = lines_exp_int_2d ( pa, pb, v1, v2 );

      return

    end

  end
%
%  If the calculation fell through the loop, then something's wrong.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHAPE_RAY_INT_2D - Fatal error!\n' );
  fprintf ( 1, '  Cannot find intersection of ray and shape.\n' );
  error ( 'SHAPE_RAY_INT_2D - Fatal error!' );

  return
end
