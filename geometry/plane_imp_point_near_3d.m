function pn = plane_imp_point_near_3d ( a, b, c, d, p )

%*****************************************************************************80
%
%% PLANE_IMP_POINT_NEAR_3D: nearest point on a implicit plane to a point in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    The normal N to the plane is (A,B,C).
%
%    The line defined by (XN-P(1))/A = (YN-P(2))/B = (ZN-P(3))/C = T
%    goes through P and is parallel to N.
%
%    Solving for the point (XN,YN,ZN) we get
%
%      XN = A*T+P(1)
%      YN = B*T+P(2)
%      ZN = C*T+P(3)
%
%    Now place these values in the equation for the plane:
%
%      A*(A*T+P(1)) + B*(B*T+P(2)) + C*(C*T+P(3)) + D = 0
%
%    and solve for T:
%
%      T = (-A*P(1)-B*P(2)-C*P(3)-D) / (A * A + B * B + C * C )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, D, the implicit plane parameters.
%
%    Input, real P(3), the coordinates of the point.
%
%    Output, real PN(3), the nearest point on the plane.
%
  dim_num = 3;

  if ( plane_imp_is_degenerate_3d ( a, b, c ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_IMP_POINT_NEAR_3D - Fatal error!\n' );
    fprintf ( 1, '  A = B = C = 0.\n' );
    error ( 'PLANE_IMP_POINT_NEAR_3D - Fatal error!' );
  end

  t = - ( a * p(1) + b * p(2) + c * p(3) + d ) / ( a * a + b * b + c * c );

  pn(1) = p(1) + a * t;
  pn(2) = p(2) + b * t;
  pn(3) = p(3) + c * t;

  return
end
