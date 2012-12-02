function dist = sphere_distance3 ( lat1, lon1, lat2, lon2, r )

%*****************************************************************************80
%
%% SPHERE_DISTANCE3 computes great circle distances on a sphere.
%
%  Discussion:
%
%    This computation is a special form of the Vincenty formula.
%    It should be less sensitive to errors associated with very small
%    or very large angular separations.
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
  top = ( cos ( lat2 ) * sin ( lon1 - lon2 ) ).^2 ...
      + ( cos ( lat1 ) * sin ( lat2 ) ...
      -   sin ( lat1 ) * cos ( lat2 ) * cos ( lon1 - lon2 ) ).^2;

  top = sqrt ( top );

  bot = sin ( lat1 ) * sin ( lat2 ) ...
      + cos ( lat1 ) * cos ( lat2 ) * cos ( lon1 - lon2 );

  dist = r * atan2 ( top, bot );

  return
end
