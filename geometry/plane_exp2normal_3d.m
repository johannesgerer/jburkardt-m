function [ pp, normal ] = plane_exp2normal_3d ( p1, p2, p3 )

%*****************************************************************************80
%
%% PLANE_EXP2NORMAL_3D converts an explicit plane to normal form in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is
%
%      the plane through P1, P2 and P3.
%
%    The normal form of a plane in 3D is
%
%      PP, a point on the plane, and
%      N, the unit normal to the plane.
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
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Output, real PP(3), a point on the plane.
%
%    Output, real NORMAL(3), a unit normal vector to the plane.
%
  dim_num = 3;

  pp(1:dim_num) = p1(1:dim_num);

  normal(1) = ( p2(2) - p1(2) ) * ( p3(3) - p1(3) ) ...
            - ( p2(3) - p1(3) ) * ( p3(2) - p1(2) );

  normal(2) = ( p2(3) - p1(3) ) * ( p3(1) - p1(1) ) ...
            - ( p2(1) - p1(1) ) * ( p3(3) - p1(3) );

  normal(3) = ( p2(1) - p1(1) ) * ( p3(2) - p1(2) ) ...
            - ( p2(2) - p1(2) ) * ( p3(1) - p1(1) );

  norm = sqrt ( sum ( normal(1:dim_num).^2 ) );

  if ( norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_EXP2NORMAL_3D - Fatal error!\n' );
    fprintf ( 1, '  The normal vector is null.\n' );
    fprintf ( 1, '  Two points coincide, or nearly so.\n' );
    error ( 'PLANE_EXP2NORMAL_3D - Fatal error!' );
  end

  normal(1:dim_num) = normal(1:dim_num) / norm;

  return
end
