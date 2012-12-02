function dist = sphere_distance2 ( lat1, lon1, lat2, lon2, r )

%*****************************************************************************80
%
%% SPHERE_DISTANCE2 computes great circle distances on a sphere.
%
%  Discussion:
%
%    This computation is written in terms of haversines, and can be more
%    accurate when measuring small angular distances.  It can be somewhat
%    inaccurate when the two points are antipodal.
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
  s = ( sin ( ( lat1 - lat2 ) / 2.0 ) ).^2 ...
    + cos ( lat1 ) * cos ( lat2 ) * ( sin ( ( lon1 - lon2 ) / 2.0 ) ).^2;

  s = sqrt ( s );

  dist = 2.0 * r * asin ( s );

  return
end
