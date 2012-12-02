function theta = radec_distance_3d ( ra1, dec1, ra2, dec2 )

%*****************************************************************************80
%
%% RADEC_DISTANCE_3D - angular distance, astronomical units, sphere in 3D.
%
%  Discussion:
%
%    Right ascension is measured in hours, between 0 and 24, and
%    essentially measures longitude.
%
%    Declination measures the angle from the equator towards the north pole,
%    and ranges from -90 (South Pole) to 90 (North Pole).
%
%    On the unit sphere, the angular separation between two points is
%    equal to their geodesic or great circle distance.  On any other
%    sphere, multiply the angular separation by the radius of the
%    sphere to get the geodesic or great circle distance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real RA1, DEC1, RA2, DEC2, the right ascension and
%    declination of the two points.
%
%    Output, real THETA, the angular separation between the points,
%    in radians.
%
  theta1 = degrees_to_radians ( 15.0 * ra1 );
  phi1 = degrees_to_radians ( dec1 );
%
%  For some blasted illogical reason, MATLAB will not let me
%  use the COS function inside a square bracket...Lunacy.
%
  v1 = zeros ( 3, 1 );
  v1(1,1) = cos ( theta1 ) * cos ( phi1 );
  v1(2,1) = sin ( theta1 ) * cos ( phi1 );
  v1(3,1) =                  sin ( phi1 );

  norm_v1 = sqrt ( sum ( v1(1:3).^2 ) );

  theta2 = degrees_to_radians ( 15.0 * ra2 );
  phi2 = degrees_to_radians ( dec2 );

  v2 = zeros ( 3, 1 );
  v2(1,1) = cos ( theta2 ) * cos ( phi2 );
  v2(2,1) = sin ( theta2 ) * cos ( phi2 );
  v2(3,1) =                  sin ( phi2 );

  norm_v2 = sqrt ( sum ( v2(1:3,1).^2 ) );

  cos_theta = ( v1(1:3,1)' * v2(1:3,1) ) / ( norm_v1 * norm_v2 );

  theta = r8_acos ( cos_theta );

  return
end
