function value = cone_volume_3d ( r, h )

%*****************************************************************************80
%
%% CONE_VOLUME_3D returns the volume of a cone in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the base of the cone.
%
%    Input, real H, the height of the cone.
%
%    Output, real CONE_VOLUME_3D, the volume of the cone.
%
  value = ( pi / 3.0 ) * h * r * r;

  return
end
