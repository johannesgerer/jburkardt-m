function p = sphere_imp_local2xyz_3d ( r, center, theta, phi )

%*****************************************************************************80
%
%% SPHERE_IMP_LOCAL2XYZ_3D converts local to XYZ coordinates on an implicit sphere in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
%
%    The "local" spherical coordinates of a point are two angles, THETA and PHI.
%    PHI measures the angle that the vector from the origin to the point
%    makes with the positive Z axis.  THETA measures the angle that the
%    projection of the vector onto the XY plane makes with the positive X axis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real CENTER(3), the center of the sphere.
%
%    Input, real THETA, PHI, the local (THETA,PHI) spherical
%    coordinates of a point on the sphere.  THETA and PHI are angles,
%    measured in radians.  Usually, 0 <= THETA < 2 * PI, and 0 <= PHI <= PI.
%
%    Output, real P(3), the XYZ coordinates of the point.
%
  p(1) = center(1) + r * sin ( phi ) * cos ( theta );
  p(2) = center(2) + r * sin ( phi ) * sin ( theta );
  p(3) = center(3) + r * cos ( phi );

  return
end
