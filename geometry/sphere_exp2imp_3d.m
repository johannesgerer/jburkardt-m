function [ r, center ] = sphere_exp2imp_3d ( p1, p2, p3, p4 )

%*****************************************************************************80
%
%% SPHERE_EXP2IMP_3D converts a sphere from explicit to implicit form in 3D.
%
%  Discussion:
%
%    An explicit sphere in 3D is determined by four points,
%    which should be distinct, and not coplanar.
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
%    10 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), P4(3),
%    four distinct noncoplanar points on the sphere.
%
%    Output, real R, CENTER(3), the radius and the center
%    of the sphere.  If the linear system is
%    singular, then R = -1, CENTER(1:3) = 0.
%
  dim_num = 3;

  tetra(1:dim_num,1:4) = [ ...
    p1(1:dim_num); p2(1:dim_num); p3(1:dim_num); p4(1:dim_num) ]';

  [ r, center ] = tetrahedron_circumsphere_3d ( tetra );

  return
end
