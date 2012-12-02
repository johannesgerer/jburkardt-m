function inside = triangle_contains_point_2d_3 ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_CONTAINS_POINT_2D_3 finds if a point is inside a triangle in 2D.
%
%  Discussion:
%
%    This routine is the same as TRIANGLE_CONTAINS_POINT_2D_2, except
%    that it does not assume an ordering of the points.  It should
%    work correctly whether the vertices of the triangle are listed
%    in clockwise or counter clockwise order.
%
%    The routine determines if a point P is "to the right of" each of the lines
%    that bound the triangle.  It does this by computing the cross product
%    of vectors from a vertex to its next vertex, and to P.
%
%    The point is inside the triangle if it is to the right of all
%    the lines, or to the left of all the lines.
%
%    This version was suggested by Paulo Ernesto of Maptek Brasil.
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
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is inside
%    the triangle or on its boundary.
%
  dim_num = 2;

  dir_old = 0.0;

  for j = 1 : 3

    k = mod ( j, 3 ) + 1;

    dir_new = ( p(1,1) - t(1,j) ) * ( t(2,k) - t(2,j) ) ...
            - ( p(2,1) - t(2,j) ) * ( t(1,k) - t(1,j) );

    if ( dir_new * dir_old < 0.0 )
      inside = 0;
      return
    end

    if ( dir_new ~= 0.0 )
      dir_old = dir_new;
    end

  end

  inside = 1;

  return
end
