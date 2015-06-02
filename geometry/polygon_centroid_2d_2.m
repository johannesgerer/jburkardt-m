function centroid = polygon_centroid_2d_2 ( n, v )

%*****************************************************************************80
%
%% POLYGON_CENTROID_2D_2 computes the centroid of a polygon in 2D.
%
%  Discussion:
%
%    The centroid is the area-weighted sum of the centroids of
%    disjoint triangles that make up the polygon.
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
%    Input, real V(2,N), the coordinates of the vertices.
%
%    Output, real CENTROID(2,1), the coordinates of the centroid.
%
  area = 0.0;
  centroid(1:2) = 0.0;

  for i = 1 : n - 2

    t(1:2,1:3) = [ v(1:2,i)'; v(1:2,i+1)'; v(1:2,n)' ]';

    area_triangle = triangle_area_2d ( t );

    area = area + area_triangle;

    centroid(1:2,1) = centroid(1:2,1) + area_triangle ...
      * ( v(1:2,i) + v(1:2,i+1) + v(1:2,n) ) / 3.0;

  end

  if ( area == 0.0 )
    centroid(1:2,1) = v(1:2,1);
  else
    centroid(1:2,1) = centroid(1:2,1) / area;
  end

  return
end
