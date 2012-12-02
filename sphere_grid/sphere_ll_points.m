function p = sphere_ll_points ( r, pc, lat_num, long_num, point_num )

%*****************************************************************************80
%
%% SPHERE_LL_POINTS produces points on a latitude/longitude grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real PC(3,1), the center of the sphere.
%
%    Input, integer LAT_NUM, LONG_NUM, the number of latitude and longitude
%    lines to draw.  The latitudes do not include the North and South
%    poles, which will be included automatically, so LAT_NUM = 5, for instance,
%    will result in points along 7 lines of latitude.
%
%    Input, integer POINT_NUM, the number of grid points.
%
%    Output, real P(3,POINT_NUM), the grid points.
%
  n = 0;
  p = zeros ( 3, point_num );
%
%  The north pole.
%
  theta = 0.0;
  phi = 0.0;
  n = n + 1;
  p(1,n) = pc(1,1) + r * sin ( phi ) * cos ( theta );
  p(2,n) = pc(2,1) + r * sin ( phi ) * sin ( theta );
  p(3,n) = pc(3,1) + r * cos ( phi );
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
      p(1,n) = pc(1,1) + r * sin ( phi ) * cos ( theta );
      p(2,n) = pc(2,1) + r * sin ( phi ) * sin ( theta );
      p(3,n) = pc(3,1) + r * cos ( phi );

    end
  end
%
%  The south pole.
%
  theta = 0.0;
  phi = pi;
  n = n + 1;
  p(1,n) = pc(1,1) + r * sin ( phi ) * cos ( theta );
  p(2,n) = pc(2,1) + r * sin ( phi ) * sin ( theta );
  p(3,n) = pc(3,1) + r * cos ( phi );

  return
end
