function [ a, b, c, d ] = plane_normal2imp_3d ( pp, normal )

%*****************************************************************************80
%
%% PLANE_NORMAL2IMP_3D converts a normal form plane to implicit form in 3D.
%
%  Discussion:
%
%    The normal form of a plane in 3D is
%
%      PP, a point on the plane, and
%      N, the unit normal to the plane.
%
%    The implicit form of a plane in 3D is
%
%      A * X + B * Y + C * Z + D = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PP(3), a point on the plane.
%
%    Input, real NORMAL(3), the unit normal vector to the plane.
%
%    Output, real A, B, C, D, the implicit plane parameters.
%
  a = normal(1);
  b = normal(2);
  c = normal(3);
  d = - a * pp(1) - b * pp(2) - c * pp(3);

  return
end
