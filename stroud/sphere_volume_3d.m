function volume = sphere_volume_3d ( r )

%*****************************************************************************80
%
%% SPHERE_VOLUME_3D computes the volume of an implicit sphere in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )^2 ) = R * R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2008
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
  volume = ( 4.0 / 3.0 ) * pi * r * r * r;

  return
end
