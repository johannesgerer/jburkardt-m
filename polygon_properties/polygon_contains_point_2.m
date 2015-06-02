function inside = polygon_contains_point_2 ( n, v, p )

%*****************************************************************************80
%
%% POLYGON_CONTAINS_POINT_2 finds if a point is inside a convex polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of nodes or vertices in the polygon.
%    N must be at least 3.
%
%    Input, real V(2,N), the vertices of the polygon.
%
%    Input, real P(2,1), the coordinates of the point to be tested.
%
%    Output, logical INSIDE, is TRUE if the point is inside
%    the polygon or on its boundary.
%
  inside = 0;
%
%  A point is inside a convex polygon if and only if it is inside
%  one of the triangles formed by X(1),Y(1) and any two consecutive
%  points on the polygon's circumference.
%
  t(1:2,1) = v(1:2,1);

  for i = 2 : n - 1

    t(1:2,2) = v(1:2,i);
    t(1:2,3) = v(1:2,i+1);

    inside = triangle_contains_point_1 ( t, p );

    if ( inside )
      return
    end

  end

  return
end
