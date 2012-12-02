function dist = sphere_distance1 ( lat1, lon1, lat2, lon2, r )

%*****************************************************************************80
%
%% SPHERE_DISTANCE1 computes great circle distances on a sphere.
%
%  Discussion:
%
%    This computation is based on the law of cosines for spheres.
%    This formula can suffer from rounding errors when the angular
%    distances are small.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    "Great-circle distance",
%    Wikipedia.
%
%  Parameters:
%
%    Input, real LAT1, LON1, the latitude and longitude of
%    the first point.
%
%    Input, real LAT2, LON2, the latitude and longitude of
%    the second point.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real DIST, the great circle distance between
%    the points, measured in the same units as R.
%
  c = cos ( lat1 ) * cos ( lat2 ) * cos ( lon1 - lon2 ) ...
    + sin ( lat1 ) * sin ( lat2 );

  dist = r * acos ( c );

  return
end
