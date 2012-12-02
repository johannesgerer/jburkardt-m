function [ vran, seed ] = direction_uniform_3d ( seed )

%*****************************************************************************80
%
%% DIRECTION_UNIFORM_3D picks a random direction vector in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real VRAN(3), the random direction vector,
%    with unit norm.
%
%    Output, integer SEED, a seed for the random number generator.
%
  dim_num = 3;
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

  phi = r8_acos ( vdot );
%
%  Pick a uniformly random rotation between 0 and 2 Pi around the
%  axis of the Z vector.
%
  [ theta, seed ] = r8_uniform_01 ( seed );
  theta = 2.0 * pi * theta;

  vran(1) = cos ( theta ) * sin ( phi );
  vran(2) = sin ( theta ) * sin ( phi );
  vran(3) = cos ( phi );

  return
end
