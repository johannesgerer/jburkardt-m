function [ x, seed ] = sphere_unit_sample_3d_2 ( seed )

%*****************************************************************************80
%
%% SPHERE_UNIT_SAMPLE_3D_2 is a BAD method for sampling the unit sphere in 3D.
%
%  Discussion:
%
%    The unit sphere in 3D satisfies:
%
%      X * X + Y * Y + Z * Z = 1
%
%    Points on the unit sphere have coordinates ( PHI, THETA ) where
%    PHI varies from 0 to PI, and THETA from 0 to 2 PI, so that:
%
%    x = cos ( theta ) * sin ( phi )
%    y = sin ( theta ) * sin ( phi )
%    z =                 cos ( phi )
%
%    This routine implements a sampling of the sphere that simply
%    picks PHI and THETA uniformly at random from their ranges.
%    This is a uniform sampling on the cylinder, but it is NOT
%    a uniform sampling on the sphere.  I implement it here just
%    so I can run some tests against the code in SPHERE_UNIT_SAMPLE_3D.
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(3), the sample point.
%
%    Output, integer SEED, a seed for the random number generator.
%
  dim_num = 3;

  [ phi, seed ] = r8_uniform_01 ( seed );
  phi = pi * phi;

  [ theta, seed ] = r8_uniform_01 ( seed );
  theta = 2.0 * pi * theta;

  x(1) = cos ( theta ) * sin ( phi );
  x(2) = sin ( theta ) * sin ( phi );
  x(3) = cos ( phi );

  return
end
