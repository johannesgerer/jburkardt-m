function solid_angle = polygon_solid_angle_3d ( n, v, p )

%*****************************************************************************80
%
%% POLYGON_SOLID_ANGLE_3D: projected solid angle of a 3D plane polygon.
%
%  Discussion:
%
%    A point P is at the center of a unit sphere.  A planar polygon
%    is to be projected onto the surface of this sphere, by drawing
%    the ray from P to each polygonal vertex, and noting where this ray
%    intersects the sphere.
%
%    We compute the area on the sphere of the projected polygon.
%
%    Since we are projecting the polygon onto a unit sphere, the area 
%    of the projected polygon is equal to the solid angle subtended by 
%    the polygon.
%
%    The value returned by this routine will include a sign.  The
%    angle subtended will be NEGATIVE if the normal vector defined by
%    the polygon points AWAY from the viewing point, and will be
%    POSITIVE if the normal vector points towards the viewing point.
%
%    If the orientation of the polygon is of no interest to you,
%    then you can probably simply take the absolute value of the
%    solid angle as the information you want.
%
%    When vectors are employed in this function, they are required to
%    be column vectors, not row vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paulo Cezar Pinto Carvalho, Paulo Roma Cavalcanti,
%    Point in Polyhedron Testing Using Spherical Polygons,
%    in Graphics Gems V,
%    edited by Alan Paeth,
%    Academic Press, 1995,
%    ISBN: 0125434553,
%    LC: T385.G6975.
%
%  Parameters:
%
%    Input, integer N, the number of vertices.
%
%    Input, real V(3,N), the coordinates of the vertices.
%
%    Input, real P(3,1), the point at the center of the unit sphere.
%
%    Output, real SOLID_ANGLE, the solid angle subtended
%    by the polygon, as projected onto the unit sphere around the point P.
%
  dim_num = 3;

  if ( n < 3 )
    solid_angle = 0.0;
    return
  end

  plane = polygon_normal_3d ( n, v );

  a(1:3,1) = v(1:3,n) - v(1:3,1);

  area = 0.0;

  for j = 1 : n

    r1(1:dim_num,1) = v(1:dim_num,j) - p(1:dim_num,1);

    jp1 = i4_wrap ( j + 1, 1, n );

    b(1:dim_num,1) = v(1:dim_num,jp1) - v(1:dim_num,j);

    normal1 = r8vec_cross_product_3d ( a, r1 );

    normal1_norm = r8vec_norm ( dim_num, normal1 );

    normal2 = r8vec_cross_product_3d ( r1, b );

    normal2_norm = r8vec_norm ( dim_num, normal2 );

    s = ( normal1(1:3,1)' * normal2(1:3,1) ) ...
      / ( normal1_norm * normal2_norm );

    angle = r8_acos ( s );

    s = r8vec_scalar_triple_product ( b, a, plane );

    if ( 0.0 < s )
      area = area + pi - angle;
    else
      area = area + pi + angle;
    end

    a(1:dim_num,1) = - b(1:dim_num,1);

  end

  area = area - pi * ( n - 2 );

  if ( 0.0 < plane(1:dim_num,1)' * r1(1:dim_num,1) )
    solid_angle = -area;
  else
    solid_angle = area;
  end

  return
end
