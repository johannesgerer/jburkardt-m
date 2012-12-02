function area = polygon_area_3d_2 ( n, v, area )

%*****************************************************************************80
%
%% POLYGON_AREA_3D_2 computes the area of a polygon in 3D.
%
%  Discussion:
%
%    The computation is not valid unless the vertices of the polygon
%    lie in a plane, so that the polygon that is defined is "flat".
%
%    The polygon does not have to be "regular", that is, neither its
%    sides nor its angles need to be equal.
%
%    The area is computed as the sum of the areas of the triangles 
%    formed by the last node with consecutive pairs of nodes (1,2),
%    (2,3), ..., and (N-2,N-1).
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
%    Input, integer N, the number of vertices of the polygon.
%
%    Input, real V(3,N), the coordinates of the vertices.
%
%    Output, real AREA, the area of the polygon.
%
  dim_num = 3;

  area_vector(1:dim_num) = 0.0;

  for i = 1 : n - 2

    t(1:dim_num,1:3) = [ v(1:dim_num,i)'; v(1:dim_num,i+1)'; v(1:dim_num,n)' ]';

    area_vector_triangle = triangle_area_vector_3d ( t );

    area_vector(1:dim_num) = area_vector(1:dim_num) ...
      + area_vector_triangle(1:dim_num);

  end

  area = 0.5 * sqrt ( sum ( area_vector(1:dim_num).^2 ) );

  return
end
