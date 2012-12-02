function centroid = triangle_centroid_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CENTROID_2D computes the centroid of a triangle in 2D.
%
%  Discussion:
%
%    The centroid of a triangle can also be considered the
%    center of gravity, or center of mass, assuming that the triangle
%    is made of a thin uniform sheet of massy material.
%
%    The centroid of a triangle is the intersection of the medians.
%
%    A median of a triangle is a line connecting a vertex to the
%    midpoint of the opposite side.
%
%    In barycentric coordinates, in which the vertices of the triangle
%    have the coordinates (1,0,0), (0,1,0) and (0,0,1), the centroid
%    has coordinates (1/3,1/3,1/3).
%
%    In geometry, the centroid of a triangle is often symbolized by "G".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTROID(2,1), the coordinates of the centroid.
%
  dim_num = 2;

  for i = 1 : dim_num
    centroid(i,1) = sum ( t(i,1:3) ) / 3.0;
  end

  return
end
