function [ num_int, pint ] = halfspace_triangle_int_3d ( t, dist1, dist2, dist3 )

%*****************************************************************************80
%
%% HALFSPACE_TRIANGLE_INT_3D: intersection ( halfspace, triangle ) in 3D.
%
%  Discussion:
%
%    The triangle is specified by listing its three vertices.
%
%    The halfspace is not described in the input data.  Rather, the
%    distances from the triangle vertices to the halfspace are given.
%
%    The intersection may be described by the number of vertices of the
%    triangle that are included in the halfspace, and by the location of
%    points between vertices that separate a side of the triangle into
%    an included part and an unincluded part.
%
%    0 vertices, 0 separators    (no intersection)
%    1 vertex, 0 separators      (point intersection)
%    2 vertices, 0 separators    (line intersection)
%    3 vertices, 0 separators    (triangle intersection)
%
%    1 vertex, 2 separators,     (intersection is a triangle)
%    2 vertices, 2 separators,   (intersection is a quadrilateral).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(3,3), the vertices of the triangle.
%
%    Input, real DIST1, DIST2, DIST3, the distances from each of
%    the three vertices of the triangle to the halfspace.  The distance is
%    zero if a vertex lies within the halfspace, or on the plane that
%    defines the boundary of the halfspace.  Otherwise, it is the
%    distance from that vertex to the bounding plane.
%
%    Output, integer NUM_INT, the number of intersection points returned,
%    which will always be between 0 and 4.
%
%    Output, real PINT(3,4), the coordinates of the NUM_INT
%    intersection points.  The points will lie in sequence on the triangle.
%    Some points will be vertices, and some may be separators.
%
  dim_num = 3;
%
%  Walk around the triangle, looking for vertices that are included,
%  and points of separation.
%
  num_int = 0;
  pint = [];

  if ( dist1 <= 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = t(1:dim_num,1);
  end

  if ( dist1 * dist2 < 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = ( dist1 * t(1:dim_num,2) - dist2 * t(1:dim_num,1) ) ...
      / ( dist1 - dist2 );
  end

  if ( dist2 <= 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = t(1:dim_num,2);
  end

  if ( dist2 * dist3 < 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = ( dist2 * t(1:dim_num,3) - dist3 * t(1:dim_num,2) ) ...
      / ( dist2 - dist3 );
  end

  if ( dist3 <= 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = t(1:dim_num,3);
  end

  if ( dist3 * dist1 < 0.0 )
    num_int = num_int + 1;
    pint(1:dim_num,num_int) = ( dist3 * t(1:dim_num,1) - dist1 * t(1:dim_num,3) ) ...
      / ( dist3 - dist1 );
  end

  return
end
