function inside = triangle_contains_point_2d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_CONTAINS_POINT_2D finds if a point is inside a triangle in 2D.
%
%  Discussion:
%
%    The routine assumes that the vertices are given in counter-clockwise
%    order.
%
%    The routine determines if a point P is "to the right of" each of the lines
%    that bound the triangle.  It does this by computing the cross product
%    of vectors from a vertex to its next vertex, and to P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%    The vertices should be given in counter clockwise order.
%
%    Input, real P(2), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is inside
%    the triangle or on its boundary.
%
  dim_num = 2;

  inside = 0;

  if ( 0.0 < ( p(1)   - t(1,1) ) * ( t(2,2) - t(2,1) ) ...
           - ( t(1,2) - t(1,1) ) * ( p(2)   - t(2,1) ) );
    return
  end

  if ( 0.0 < ( p(1)   - t(1,2) ) * ( t(2,3) - t(2,2) ) ...
           - ( t(1,3) - t(1,2) ) * ( p(2)   - t(2,2) ) );
    return
  end

  if ( 0.0 < ( p(1)   - t(1,3) ) * ( t(2,1) - t(2,3) ) ...
           - ( t(1,1) - t(1,3) ) * ( p(2)   - t(2,3) ) );
    return
  end

  inside = 1;

  return
end
