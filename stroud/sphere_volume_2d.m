function volume = sphere_volume_2d ( r )

%*****************************************************************************80
%
%% SPHERE_VOLUME_2D computes the volume of an implicit sphere in 2D.
%
%  Discussion:
%
%    An implicit sphere in 2D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )^2 ) = R * R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Output, real VOLUME, the volume of the sphere.
%
  volume = pi * r * r;

  return
end
