function area = sphere_imp_area_3d ( r )

%*****************************************************************************80
%
%% SPHERE_IMP_AREA_3D computes the surface area of an implicit sphere in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Output, real AREA, the area of the sphere.
%
  area = 4.0 * pi * r * r;

  return
end
