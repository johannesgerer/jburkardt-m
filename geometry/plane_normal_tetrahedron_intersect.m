function [ int_num, pint ] = plane_normal_tetrahedron_intersect ( pp, ...
  normal, t )

%*****************************************************************************80
%
%% PLANE_NORMAL_TETRAHEDRON_INTERSECT intersects a plane and a tetrahedron.
%
%  Discussion:
%
%    The intersection of a plane and a tetrahedron is one of:
%    0) empty
%    1) a single point
%    2) a single line segment
%    3) a triangle
%    4) a quadrilateral.
%
%    In each case, the region of intersection can be described by the
%    corresponding number of points.  In particular, cases 2, 3 and 4
%    are described by the vertices that bound the line segment, triangle,
%    or quadrilateral.
%
%    The normal form of a plane is:
%
%      PP is a point on the plane,
%      N is a normal vector to the plane.
%
%    The form of a tetrahedron is
%
%      T(1:3,1:4) contains the coordinates of the vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PP(3), a point on the plane.
%
%    Input, real NORMAL(3), a normal vector to the plane.
%
%    Input, real T(3,4), the tetrahedron vertices.
%
%    Output, integer INT_NUM, the number of intersection
%    points returned.  This will be 0, 1, 2, 3 or 4.
%
%    Output, real PINT(3,4), the coordinates of the
%    intersection points.
%
  int_num = 0;
  pint(1:3,1:4) = 0.0;
%
%  DN is the length of the normal vector.
%
  normal = normal(:);
  pp = pp(:);

  dn = sqrt ( normal(1:3)' * normal(1:3) );
%
%  DPP is the distance between the origin and the projection of the
%  point PP onto the normal vector.
%
  dpp = dn - normal(1:3)' * pp(1:3);
%
%  D(I) is positive, zero, or negative if vertex I is above,
%  on, or below the plane.
%
  d(1:4) = dn - normal(1:3)' * t(1:3,1:4) - dpp;
%
%  If all D are positive or negative, no intersection.
%
  if ( all ( d(1:4) < 0.0D+00 ) || all ( 0.0D+00 < d(1:4) ) )
    int_num = 0;
    return
  end
%
%  Points with zero distance are automatically added to the list.
%
%  For each point with nonzero distance, seek another point
%  with opposite sign and higher index, and compute the intersection
%  of the line between those points and the plane.
%
  for j1 = 1 : 4

    if ( d(j1) == 0.0 )
      int_num = int_num + 1;
      pint(1:3,int_num) = t(1:3,j1);
    else
      for j2 = j1 + 1 : 4
        if ( r8_sign_opposite_strict ( d(j1), d(j2) ) )
          int_num = int_num + 1;
          pint(1:3,int_num) = ( d(j1)         * t(1:3,j2)   ...
                                      - d(j2) * t(1:3,j1) ) ...
                            / ( d(j1) - d(j2) );
        end
      end
    end
  end
%
%  If four points were found, order them properly.
%
  if ( int_num == 4 )
    area1 = quad_area_3d ( pint );
    pint2 = pint;
    pint2(1:3,3) = pint(1:3,4);
    pint2(1:3,4) = pint(1:3,3);
    area2 = quad_area_3d ( pint2 );
    if ( area1 < area2 )
      pint = pint2;
    end
  end

  return
end
