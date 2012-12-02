function contains = sphere_triangle_contains_point ( v1, v2, v3, p )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_CONTAINS_POINT determines if a spherical triangle contains a point.
%
%  Discussion:
%
%    A sphere centered at 0 in 3D satisfies the equation:
%
%      X*X + Y*Y + Z*Z = R*R
%
%    A spherical triangle is specified by three points on the surface
%    of the sphere.  The inside of the triangle is defined by the fact
%    that the three points are listed in counterclockwise order. 
%    Here "counterclockwise" is with reference to an observer standing
%    outside the sphere.
%
%    If P is a point on the sphere, we say that the spherical triangle
%    "contains" P if P is in the interior of the spherical triangle.
%    We do not actually require that P be a point on the sphere.  Instead,
%    we consider the ray defined from the origin through P, which intersects
%    the sphere.  It is essentially this point of intersection we are
%    considering.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), V3(3), the vertices of the triangle.
%
%    Input, real P(3), a point on the sphere, or the point on
%    the sphere determined by the ray from the origin through P.  P must
%    not be zero.
%
%    Output, real CONTAINS, is positive if the spherical triangle
%    contains P, zero if P is exactly on the boundary of the triangle, and
%    negative if P is outside the triangle.  
%
  dim_num = 3;
%
%  Determine the normal vector to (V1,V2,V3), which is (V2-V1)x(V3-V13)..
%
  normal_direction(1) = ( v2(2) - v1(2) ) * ( v3(3) - v1(3) ) ...
                      - ( v2(3) - v1(3) ) * ( v3(2) - v1(2) );

  normal_direction(2) = ( v2(3) - v1(3) ) * ( v3(1) - v1(1) ) ...
                      - ( v2(1) - v1(1) ) * ( v3(3) - v1(3) );

  normal_direction(3) = ( v2(1) - v1(1) ) * ( v3(2) - v1(2) ) ...
                      - ( v2(2) - v1(2) ) * ( v3(1) - v1(1) );

  normal_norm = sqrt ( sum ( normal_direction(1:dim_num).^2 ) );

  if ( normal_norm == 0.0 )
    contains = - r8_huge ( );
    return
  end

  normal_direction(1:dim_num) = normal_direction(1:dim_num) / normal_norm;
%
%  Determine the length of P.
%
  p_norm = sqrt ( sum ( p(1:dim_num).^2 ) );

  if ( p_norm == 0.0 )
    contains = - r8_huge ( );
    return
  end

  p_direction(1:dim_num) = p_direction(1:dim_num) / p_norm;
%
%  CONTAINS is the dot product of the normal vector to (V1,V2,V3)
%  against the unit direction vector defined by P.
%
  contains = ( normal_direction(1:3) * p_direction(1:3)';

  return
end
