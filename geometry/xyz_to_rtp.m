function [ r, theta, phi ] = xyz_to_rtp ( xyz )

%*****************************************************************************80
%
%% XYZ_TO_RTP converts (X,Y,Z) to (R,Theta,Phi) coordinates.
%
%  Discussion:
%
%    Given an XYZ point, compute its distance R from the origin, and
%    regard it as lying on a sphere of radius R, whose axis is the Z
%    axis.
%
%    Theta measures the "longitude" of the point, between 0 and 2 PI.
%
%    PHI measures the angle from the "north pole", between 0 and PI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XYZ(3,1), the coordinates of a point in 3D.
%
%    Output, real R, THETA, PHI, the radius, longitude and
%    declination of the point.
%

  r = sqrt ( sum ( xyz(1:3,1).^2 )  );

  if ( r == 0.0 )
    theta = 0.0;
    phi = 0.0;
    return
  end

  phi = r8_acos ( xyz(3,1) / r );

  theta = r8_atan ( xyz(2,1), xyz(1,1) );

  return
end
