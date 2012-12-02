function [ p1, p2, p3 ] = plane_normal2exp_3d ( pp, normal )

%*****************************************************************************80
%
%% PLANE_NORMAL2EXP_3D converts a normal plane to explicit form in 3D.
%
%  Discussion:
%
%    The normal form of a plane in 3D is
%
%      PP, a point on the plane, and
%      N, the unit normal to the plane.
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
%    Input, real PP(3,1), a point on the plane.
%
%    Input, real NORMAL(3,1), a normal vector N to the plane.  The
%    vector must not have zero length, but it is not necessary for N
%    to have unit length.
%
%    Output, real P1(3,1), P2(3,1), P3(3,1), three points on the plane.
%
  [ pq, pr ] = plane_normal_basis_3d ( pp, normal );

  p1(1:3,1) = pp(1:3,1);
  p2(1:3,1) = pp(1:3,1) + pq(1:3,1);
  p3(1:3,1) = pp(1:3,1) + pr(1:3,1);

  return
end
