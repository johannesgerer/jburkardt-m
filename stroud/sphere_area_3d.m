function value = sphere_area_3d ( r )

%*****************************************************************************80
%
%% SPHERE_AREA_3D computes the area of a sphere in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that
%
%      X**2 + Y**2 + Z**2 = R**2
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
%    Input, real R, the radius of the sphere.
%
%    Output, real SPHERE_AREA_3D, the area of the sphere.
%
  value = 4.0E+00 * pi * r * r;

  return
end
