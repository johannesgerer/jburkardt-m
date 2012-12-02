function [ x, seed ] = uniform_in_polygon_map ( nv, v, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_POLYGON_MAP maps uniform points into a polygon.
%
%  Discussion:
%
%    If the polygon is regular, or convex, or at least star-shaped,
%    this routine will work.
%
%    This routine assumes that all points between the centroid and
%    any point on the boundary lie within the polygon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 August 2005
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
%    clockwise or counterclockwise order.
%
%    Input, integer N, the number of points to create.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(2,N), the points.
%
  dim_num = 2;
%
%  Find the centroid.
%
  centroid = polygon_centroid_2d ( nv, v );
%
%  Determine the areas of each triangle.
%
  for i = 1 : nv

    if ( i < nv )
      ip1 = i + 1;
    else
      ip1 = 1;
    end
    
    t(1:2,1) = v(1:2,i);
    t(1:2,2) = v(1:2,ip1);
    t(1:2,3) = centroid(1:2);
    
    area(i) = triangle_area_2d ( t );

  end
%
%  Normalize the areas.
%
  area(1:nv) = area(1:nv) / sum ( area(1:nv) );
%
%  Replace each area by the sum of itself and all previous ones.
%
  for i = 2 : nv
    area(i) = area(i) + area(i-1);
  end

  for j = 1 : n
%
%  Choose a triangle at random, based on areas.
%
    [ t, seed ] = r8_uniform_01 ( seed );

    for k = 1 : nv

      if ( t <= area(k) )
        i = k;
        break
      end

    end
%
%  Now choose a point at random in the triangle.
%
    if ( i < nv )
      ip1 = i + 1;
    else
      ip1 = 1;
    end

    [ r, seed ] = r8vec_uniform_01 ( dim_num, seed );

    if ( 1.0 < sum ( r(1:dim_num) ) )
      r(1:dim_num) = 1.0 - r(1:dim_num);
    end

    x(1:dim_num,j) = ( 1.0 - r(1) - r(2) ) * v(1:dim_num,i) ...
                           + r(1)          * v(1:dim_num,ip1) ...
                                  + r(2)   * centroid(1:dim_num)';

  end

  return
end
