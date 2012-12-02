function xyz = rtp_to_xyz ( r, theta, phi )

%*****************************************************************************80
%
%% RTP_TO_XYZ converts (R,Theta,Phi) to (X,Y,Z) coordinates.
%
%  Discussion:
%
%    R measures the distance of the point to the origin.
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
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, THETA, PHI, the radius, longitude, and
%    declination of a point.
%
%    Output, real XYZ(3,1), the corresponding Cartesian coordinates.
%
  xyz = zeros ( 3, 1 );

  xyz(1,1) = r * cos ( theta ) * sin ( phi );
  xyz(2,1) = r * sin ( theta ) * sin ( phi );
  xyz(3,1) = r *                 cos ( phi );

  return
end
