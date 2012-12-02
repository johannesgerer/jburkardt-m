function [ p1, p2, p3 ] = plane_imp2exp_3d ( a, b, c, d )

%*****************************************************************************80
%
%% PLANE_IMP2EXP_3D converts an implicit plane to explicit form in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is
%
%      A * X + B * Y + C * Z + D = 0.
%
%    The explicit form of a plane in 3D is
%
%      the plane through P1, P2 and P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, D, the implicit plane parameters.
%
%    Output, real P1(3,1), P2(3,1), P3(3,1), three points on the plane.
%
  [ pp, normal ] = plane_imp2normal_3d ( a, b, c, d );

  [ p1, p2, p3 ] = plane_normal2exp_3d ( pp, normal );

  return
end
