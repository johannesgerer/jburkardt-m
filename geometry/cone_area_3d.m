function area = cone_area_3d ( h, r )

%*****************************************************************************80
%
%% CONE_AREA_3D computes the surface area of a right circular cone in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real H, R, the height of the cone, and the radius of the
%    circle that forms the base of the cone.
%
%    Output, real AREA, the surface area of the cone.
%
  area = pi * r * sqrt ( h * h + r * r );

  return
end
