function p = sphere_llt_grid_points ( r, pc, lat_num, long_num, point_num )

%*****************************************************************************80
%
%% SPHERE_LLT_GRID_POINTS produces points on an LLT grid.
%
%  Discussion:
%
%    An LLT grid is a grid of triangles bounded by latitude and longitude
%    lines over the surface of a sphere in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real PC(1,3), the center of the sphere.
%
%    Input, integer LAT_NUM, LONG_NUM, the number of latitude and longitude
%    lines to draw.  The latitudes do not include the North and South
%    poles, which will be included automatically, so LAT_NUM = 5, for instance,
%    will result in points along 7 lines of latitude.
%
%    Input, integer POINT_NUM, the number of grid points.
%
%    Output, real P(POINT_NUM,3), the grid points.
%
  n = 0;
  p = zeros ( point_num, 3 );
%
%  The north pole.
%
  theta = 0.0;
  phi = 0.0;
  n = n + 1;
  p(n,1) = pc(1,1) + r * sin ( phi ) * cos ( theta );
  p(n,2) = pc(1,2) + r * sin ( phi ) * sin ( theta );
  p(n,3) = pc(1,3) + r * cos ( phi );
%
%  Do each intermediate ring of latitude.
%
  for lat = 1 : lat_num

    phi = pi * lat / ( lat_num + 1 );
%
%  Along that ring of latitude, compute points at various longitudes.
%
    for long = 0 : long_num - 1

      theta = 2.0 * pi * long / long_num;

      n = n + 1;
      p(n,1) = pc(1,1) + r * sin ( phi ) * cos ( theta );
      p(n,2) = pc(1,2) + r * sin ( phi ) * sin ( theta );
      p(n,3) = pc(1,3) + r * cos ( phi );

    end
  end
%
%  The south pole.
%
  theta = 0.0;
  phi = pi;
  n = n + 1;
  p(n,1) = pc(1,1) + r * sin ( phi ) * cos ( theta );
  p(n,2) = pc(1,2) + r * sin ( phi ) * sin ( theta );
  p(n,3) = pc(1,3) + r * cos ( phi );

  return
end
