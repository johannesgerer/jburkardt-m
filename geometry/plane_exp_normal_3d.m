function normal = plane_exp_normal_3d ( p1, p2, p3 )

%*****************************************************************************80
%
%% PLANE_EXP_NORMAL_3D finds the normal to an explicit plane in 3D.
%
%  Discussion:
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
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Output, real NORMAL(3), the coordinates of the unit normal
%    vector to the plane containing the three points.
%
  dim_num = 3;
%
%  The cross product (P2-P1) x (P3-P1) is normal to (P2-P1) and (P3-P1).
%
  normal(1) = ( p2(2) - p1(2) ) * ( p3(3) - p1(3) ) ...
            - ( p2(3) - p1(3) ) * ( p3(2) - p1(2) );

  normal(2) = ( p2(3) - p1(3) ) * ( p3(1) - p1(1) ) ...
            - ( p2(1) - p1(1) ) * ( p3(3) - p1(3) );

  normal(3) = ( p2(1) - p1(1) ) * ( p3(2) - p1(2) ) ...
            - ( p2(2) - p1(2) ) * ( p3(1) - p1(1) );

  normal_norm = sqrt ( sum ( normal(1:dim_num).^2 ) );

  if ( normal_norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_EXP_NORMAL_3D - Fatal error!\n' );
    fprintf ( 1, '  The plane is poorly defined.\n' );
    error ( 'PLANE_EXP_NORMAL_3D - Fatal error!' );
  end

  normal(1:dim_num) = normal(1:dim_num) / normal_norm;

  return
end
