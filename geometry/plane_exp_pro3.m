function pp = plane_exp_pro3 ( p1, p2, p3, n, p )

%*****************************************************************************80
%
%% PLANE_EXP_PRO3 projects points orthographically onto a plane, in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is:
%
%      the plane through P1, P2 and P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Input, integer N, the number of points to project.
%
%    Input, real P(3,N), the points.
%
%    Output, real PP(3,N), the projections of the points through 
%    the focus point onto the plane.
%
  dim_num = 3;
%
%  Put the plane into ABCD form.
%
  [ a, b, c, d ] = plane_exp2imp_3d ( p1, p2, p3 );
%
%  For each point, its image in the plane is the nearest point
%  in the plane.
%
  for i = 1 : n

    pp(1:dim_num,i) = plane_imp_point_near_3d ( a, b, c, d, p(1:dim_num,i) )';

  end

  return
end
