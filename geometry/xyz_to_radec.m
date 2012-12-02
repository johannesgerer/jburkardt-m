function [ ra, dec ] = xyz_to_radec ( p )

%*****************************************************************************80
%
%% XYZ_TO_RADEC converts (X,Y,Z) to right ascension/declination coordinates.
%
%  Discussion:
%
%    Given an XYZ point, compute its distance R from the origin, and
%    regard it as lying on a sphere of radius R, whose axis is the Z
%    axis.
%
%    The right ascension of the point is the "longitude", measured in hours,
%    between 0 and 24, with the X axis having right ascension 0, and the
%    Y axis having right ascension 6.
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
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(3,1), the coordinates of a point in 3D.
%
%    Output, real RA, DEC, the corresponding right ascension
%    and declination.
%
  p_norm = sqrt ( sum ( p(1:3,1).^2 )  );

  phi = r8_asin ( p(3,1) / p_norm );

  if ( cos ( phi ) == 0.0 )
    theta = 0.0;
  else
    theta = r8_atan ( p(2,1), p(1,1) );
  end

  dec = radians_to_degrees ( phi );
  ra = radians_to_degrees ( theta ) / 15.0;

  return
end
