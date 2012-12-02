function inside = triangle_contains_point_2d_1 ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_CONTAINS_POINT_2D_1 finds if a point is inside a triangle in 2D.
%
%  Discussion:
%
%    It is conventional to list the triangle vertices in counter clockwise
%    order.  However, this routine does not require a particular order
%    for the vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2010
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
  xsi = triangle_barycentric_2d ( t, p );

  if ( any ( xsi(1:3,1) < 0.0 ) )
    inside = 0;
  else
    inside = 1;
  end

  return
end
