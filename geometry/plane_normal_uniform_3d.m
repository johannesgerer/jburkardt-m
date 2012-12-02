function [ pp, normal, seed ] = plane_normal_uniform_3d ( seed )

%*****************************************************************************80
%
%% PLANE_NORMAL_UNIFORM_3D generates a random normal plane in 3D.
%
%  Discussion:
%
%    The normal form of a plane is:
%
%      PP is a point on the plane,
%      N is a normal vector to the plane.
%
%    The point PP will be chosen at random inside the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer SEED, a seed for the random number generator.
%
%    Output, real PP(3), a point on the plane.
%
%    Output, real NORMAL(3), the unit normal vector.
%
  dim_num = 3;
%
%  Pick PP as a random point inside the unit sphere in ND.
%
  [ pp, seed ] = ball_unit_sample_3d ( seed );
%
%  Get values from a standard normal distribution.
%
  [ normal, seed ] = r8vec_normal_01 ( dim_num, seed );
%
%  Compute the length of the vector.
%
  norm = sqrt ( sum ( normal(1:dim_num).^2 ) );
%
%  Normalize the vector.
%
  normal(1:dim_num) = normal(1:dim_num) / norm;

  return
end
