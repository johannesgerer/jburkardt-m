function [ s, seed ] = polygon_sample ( nv, v, n, seed )

%*****************************************************************************80
%
%% POLYGON_SAMPLE uniformly samples a polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NV, the number of vertices.
%
%    Input, real V(2,NV), the vertices of the polygon, listed in
%    counterclockwise order.
%
%    Input, integer N, the number of points to create.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real S(2,N), the points.
%

%
%  Triangulate the polygon.
%
  triangles = polygon_triangulate ( nv, v(1,1:nv), v(2,1:nv) );
%
%  Determine the areas of each triangle.
%
  for i = 1 : nv - 2
    area_triangle(i) = triangle_area ( ...
      v(1,triangles(1,i)), v(2,triangles(1,i)), ...
      v(1,triangles(2,i)), v(2,triangles(2,i)), ...
      v(1,triangles(3,i)), v(2,triangles(3,i)) );
  end
%
%  Normalize the areas.
%
  area_polygon = sum ( area_triangle(1:nv-2) );
  area_relative(1:nv-2) = area_triangle(1:nv-2) / area_polygon;
%
%  Replace each area by the sum of itself and all previous ones.
%
  area_cumulative(1) = area_relative(1);
  for i = 2 : nv - 2
    area_cumulative(i) = area_relative(i) + area_cumulative(i-1);
  end

  for j = 1 : n
%
%  Choose triangle I at random, based on areas.
%
    [ area_percent, seed ] = r8_uniform_01 ( seed );

    for k = 1 : nv - 2

      i = k;

      if ( area_percent <= area_cumulative(k) )
        break
      end

    end
%
%  Now choose a point at random in triangle I.
%
    [ r, seed ] = r8vec_uniform_01 ( 2, seed );

    if ( 1.0 < sum ( r(1:2) ) )
      r(1:2) = 1.0 - r(1:2);
    end

    s(1:2,j) = ( 1.0 - r(1) - r(2) ) * v(1:2,triangles(1,i)) ...
                     + r(1)          * v(1:2,triangles(2,i)) ...
                            + r(2)   * v(1:2,triangles(3,i));
  end

  return
end
