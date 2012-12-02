function dist = ll_rad_dist_sphere ( lat1, long1, lat2, long2, radius )

%*****************************************************************************80
%
%% LL_RAD_DIST_SPHERE: spherical distance, latitude and longitude in radians.
%
%  Discussion:
%
%    On a sphere of given radius, the positions of two points are given as
%    longitude and latitude, in radians.
%
%    This function determines the spherical distance or great circle distance,
%    between the two points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real LAT1, LONG1, LAT2, LONG2, the latitude and
%    longitude of the two points, in radians.
%
%    Input, real RADIUS, the radius of the sphere.
%
%    Output, real DIST, the distance between the points.
%
  theta = acos ( sin ( lat1 ) * sin ( lat2 ) ...
               + cos ( lat1 ) * cos ( lat2 ) * cos ( long1 - long2 ) );

  dist = radius * theta;

  return dist;
end
