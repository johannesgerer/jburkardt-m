function [ x, seed ] = sphere_unit_sample_3d ( n, seed )

%*****************************************************************************80
%
%% SPHERE_UNIT_SAMPLE_3D picks a random point on the unit sphere in 3D.
%
%  Discussion:
%
%    The unit sphere in 3D satisfies:
%
%      X * X + Y * Y + Z * Z = 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to compute.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(3,N), the sample point.
%
%    Output, integer SEED, a seed for the random number generator.
%
  for j = 1 : n
%
%  Pick a uniformly random VDOT, which must be between -1 and 1.
%  This represents the dot product of the random vector with the Z unit vector.
%
%  Note: this works because the surface area of the sphere between
%  Z and Z + dZ is independent of Z.  So choosing Z uniformly chooses
%  a patch of area uniformly.
%
    [ vdot, seed ] = r8_uniform_01 ( seed );
    vdot = 2.0 * vdot - 1.0;

    phi = arc_cosine ( vdot );
%
%  Pick a uniformly random rotation between 0 and 2 Pi around the
%  axis of the Z vector.
%
    [ theta, seed ] = r8_uniform_01 ( seed );
    theta = 2.0 * pi * theta;

    x(1,j) = cos ( theta ) * sin ( phi );
    x(2,j) = sin ( theta ) * sin ( phi );
    x(3,j) = cos ( phi );

  end

  return
end
