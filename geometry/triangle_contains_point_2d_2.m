function inside = triangle_contains_point_2d_2 ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_CONTAINS_POINT_2D_2 finds if a point is inside a triangle in 2D.
%
%  Discussion:
%
%    The routine assumes that the vertices are given in counter-clockwise
%    order.  If the triangle vertices are actually given in clockwise
%    order, this routine will behave as though the triangle contains
%    no points whatsoever!
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
%    07 June 2006
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
%    Input, real P(2,1), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is inside
%    the triangle or on its boundary.
%
  dim_num = 2;

  for j = 1 : 3

    k = mod ( j, 3 ) + 1;

    if ( 0.0 < ( p(1,1) - t(1,j) ) * ( t(2,k) - t(2,j) ) ...
             - ( p(2,1) - t(2,j) ) * ( t(1,k) - t(1,j) ) )
      inside = 0;
      return
    end

  end

  inside = 1;

  return
end
