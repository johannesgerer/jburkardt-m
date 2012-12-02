function p = radec_to_xyz ( ra, dec )

%*****************************************************************************80
%
%% RADEC_TO_XYZ converts right ascension/declination to (X,Y,Z) coordinates.
%
%  Discussion:
%
%    Right ascension is measured in hours, between 0 and 24, and
%    essentially measures longitude.
%
%    Declination measures the angle from the equator towards the north pole,
%    and ranges from -90 (South Pole) to 90 (North Pole).
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
%    Input, real RA, DEC, the right ascension and declination
%    of a point.
%
%    Output, real P(3,1), the corresponding coordinates of
%    a point with radius 1.
%
  theta = degrees_to_radians ( 15.0 * ra );
  phi = degrees_to_radians ( dec );

  p = zeros ( 3, 1 );

  p(1,1) = cos ( theta ) * cos ( phi );
  p(2,1) = sin ( theta ) * cos ( phi );
  p(3,1) = sin ( phi );

  return
end
