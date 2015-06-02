function area = triangle_area ( node_xy )

%*****************************************************************************80
%
%% TRIANGLE_AREA computes the area of a triangle.
%
%  Discussion:
%
%    If the triangle's vertices are given in counterclockwise order,
%    the area will be positive.  If the triangle's vertices are given
%    in clockwise order, the area will be negative%
%
%    If you cannot guarantee counterclockwise order, and you need to
%    have the area positive, then you can simply take the absolute value
%    of the result of this routine.
%
%    An earlier version of this routine always returned the absolute
%    value of the computed area.  I am convinced now that that is
%    a less useful result%  For instance, by returning the signed
%    area of a triangle, it is possible to easily compute the area
%    of a nonconvex polygon as the sum of the (possibly negative)
%    areas of triangles formed by node 1 and successive pairs of vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real NODE_XY(2,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%
  area = 0.5 * ( ...
      node_xy(1,1) * ( node_xy(2,2) - node_xy(2,3) ) ...
    + node_xy(1,2) * ( node_xy(2,3) - node_xy(2,1) ) ...
    + node_xy(1,3) * ( node_xy(2,1) - node_xy(2,2) ) );

  return
end
