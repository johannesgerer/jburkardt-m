function pp = plane_exp_pro2 ( p1, p2, p3, n, p )

%*****************************************************************************80
%
%% PLANE_EXP_PRO2 produces 2D coordinates of points that lie in a plane, in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is:
%
%      the plane through P1, P2 and P3.
%
%    The first thing to do is to compute two orthonormal vectors V1 and
%    V2, so that any point P that lies in the plane may be written as
%
%      P = P1 + alpha * V1 + beta * V2
%
%    The vector V1 lies in the direction P2-P1, and V2 lies in
%    the plane, is orthonormal to V1, and has a positive component
%    in the direction of P3-P1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2005
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
%    Input, real P(3,N), are the Cartesian
%    coordinates of points which lie on the plane spanned by the
%    three points.  These points are not checked to ensure that
%    they lie on the plane.
%
%    Output, real PP(2,N), the "in-plane" coordinates of the points.  
%
  dim_num = 3;
%
%  Compute the two basis vectors for the affine plane.
%
  v1(1:dim_num) = p2(1:dim_num) - p1(1:dim_num);

  v1 = vector_unit_nd ( dim_num, v1 );

  v2(1:dim_num) = p3(1:dim_num) - p1(1:dim_num);

  dot = v1(1:dim_num) * v2(1:dim_num)';

  v2(1:dim_num) = v2(1:dim_num) - dot * v1(1:dim_num);

  v2 = vector_unit_nd ( dim_num, v2 );
%
%  Now decompose each point.
%
  for i = 1 : n
    pp(1,i) = ( p(1:dim_num,i) - p1(1:dim_num) ) * v1(1:dim_num)';
    pp(2,i) = ( p(1:dim_num,i) - p2(1:dim_num) ) * v2(1:dim_num)';
  end

  return
end
