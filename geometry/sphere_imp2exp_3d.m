function [ p1, p2, p3, p4 ] = sphere_imp2exp_3d ( r, center )

%*****************************************************************************80
%
%% SPHERE_IMP2EXP_3D converts a sphere from implicit to explicit form in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
%
%    An explicit sphere in 3D is determined by four points,
%    which should be distinct, and not coplanar.
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
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real R, CENTER(3), the radius and center of the sphere.
%
%    Output, real P1(3), P2(3), P3(3), P4(3),
%    four distinct noncoplanar points on the sphere.
%
  dim_num = 3;

  theta = 0.0;
  phi = 0.0;

  p1(1) = center(1) + r * cos ( theta ) * sin ( phi );
  p1(2) = center(2) + r * sin ( theta ) * sin ( phi );
  p1(3) = center(3) + r                 * cos ( phi );

  theta = 0.0;
  phi = 2.0 * pi / 3.0;

  p2(1) = center(1) + r * cos ( theta ) * sin ( phi );
  p2(2) = center(2) + r * sin ( theta ) * sin ( phi );
  p2(3) = center(3) + r                 * cos ( phi );

  theta = 2.0 * pi / 3.0;
  phi = 2.0 * pi / 3.0;

  p3(1) = center(1) + r * cos ( theta ) * sin ( phi );
  p3(2) = center(2) + r * sin ( theta ) * sin ( phi );
  p3(3) = center(3) + r                 * cos ( phi );

  theta = 4.0 * pi / 3.0;
  phi = 2.0 * pi / 3.0;

  p4(1) = center(1) + r * cos ( theta ) * sin ( phi );
  p4(2) = center(2) + r * sin ( theta ) * sin ( phi );
  p4(3) = center(3) + r                 * cos ( phi );

  return
end
