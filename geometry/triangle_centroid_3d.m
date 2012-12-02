function centroid = triangle_centroid_3d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CENTROID_3D computes the centroid of a triangle in 3D.
%
%  Discussion:
%
%    The centroid of a triangle can also be considered the
%    center of gravity or center of mass, assuming that the triangle
%    is made of a thin uniform sheet of massy material.
%
%    The centroid of a triangle is the intersection of the medians.
%    A median of a triangle is a line connecting any vertex to the
%    midpoint of the opposite side.
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
%  Parameters:
%
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real CENTROID(3,1), the coordinates of the centroid.
%
  dim_num = 3;

  for i = 1 : dim_num
    centroid(i,1) = sum ( t(i,1:3) ) / 3.0;
  end

  return
end
