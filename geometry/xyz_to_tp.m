function [ theta, phi ] = xyz_to_tp ( xyz )

%*****************************************************************************80
%
%% XYZ_TO_TP converts (X,Y,Z) to (Theta,Phi) coordinates.
%
%  Discussion:
%
%    Given an XYZ point, regard it as lying on a sphere of radius R, 
%    centered at the origin, whose axis is the Z axis.
%
%    We assume that the actual value of R is of no interest, and do
%    not report it.  This is especially appropriate if the point is
%    expected to lie on the unit sphere, for instance.
%
%    THETA measures the "longitude" of the point, between 0 and 2 PI.
%
%    PHI measures the angle from the "north pole", between 0 and PI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XYZ(3,1), the coordinates of a point in 3D.
%
%    Output, real THETA, PHI, the longitude and declination 
%    of the point.
%
  r = norm ( xyz(1:3,1) );

  if ( r == 0.0 )
    theta = 0.0;
    phi = 0.0;
    return
  end

  phi = r8_acos ( xyz(3,1) / r );

  theta = r8_atan ( xyz(2,1), xyz(1,1) );

  return
end
