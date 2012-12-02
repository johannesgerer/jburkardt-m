function area_vector = triangle_area_vector_3d ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_VECTOR_3D computes the area vector of a triangle in 3D.
%
%  Discussion:
%
%    The "area vector" of a triangle is simply a cross product of,
%    for instance, the vectors (V2-V1) and (V3-V1), where V1, V2
%    and V3 are the vertices of the triangle.
%
%    The norm of the cross product vector of two vectors is the area
%    of the parallelogram they form.
%
%    Therefore, the area of the triangle is half of the norm of the
%    area vector:
%
%      area = 0.5 * sqrt ( sum ( area_vector(1:3)**2 ) )
%
%    The reason for looking at the area vector rather than the area
%    is that this makes it possible to compute the area of a flat
%    polygon in 3D by summing the areas of the triangles that form
%    a decomposition of the polygon, while allowing for both positive
%    and negative areas.  (Sum the vectors, THEN take the norm and
%    multiply by 1/2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2005
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
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real AREA_VECTOR(3,1), the area vector of the triangle.
%
  area_vector(1,1) = ( t(2,2) - t(2,1) ) * ( t(3,3) - t(3,1) ) ...
                   - ( t(3,2) - t(3,1) ) * ( t(2,3) - t(2,1) );

  area_vector(2,1) = ( t(3,2) - t(3,1) ) * ( t(1,3) - t(1,1) ) ...
                   - ( t(1,2) - t(1,1) ) * ( t(3,3) - t(3,1) );

  area_vector(3,1) = ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
                   - ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) );

  return
end
