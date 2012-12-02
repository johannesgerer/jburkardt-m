function distance = cylinder_point_dist_signed_3d ( p1, p2, r, p )

%*****************************************************************************80
%
%% CYLINDER_POINT_DIST_SIGNED_3D: signed distance from cylinder to point in 3D.
%
%  Discussion:
%
%    We are computing the signed distance to the SURFACE of the cylinder.
%
%    The surface of a (right) (finite) cylinder in 3D is defined by an axis,
%    which is the line segment from point P1 to P2, and a radius R.  The points
%    on the surface of the cylinder are:
%    * points at a distance R from the line through P1 and P2, and whose nearest
%      point on the line through P1 and P2 is strictly between P1 and P2,
%    PLUS
%    * points at a distance less than or equal to R from the line through P1
%      and P2, whose nearest point on the line through P1 and P2 is either
%      P1 or P2.
%
%    Points inside the surface have a negative distance.
%    Points on the surface have a zero distance.
%    Points outside the surface have a positive distance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), the first and last points
%    on the axis line of the cylinder.
%
%    Input, real R, the radius of the cylinder.
%
%    Input, real P(3), the point.
%
%    Output, real DISTANCE, the signed distance from the point
%    to the cylinder.
%
  dim_num = 3;

  axis(1:dim_num) = p2(1:dim_num) - p1(1:dim_num);
       
  axis_length = r8vec_norm ( dim_num, axis );

  if ( axis_length == 0.0 )
    distance = - r8_huge ( );
    return
  end

  axis(1:dim_num) = axis(1:dim_num) / axis_length;
  
  p_dot_axis = ( p(1:dim_num) - p1(1:dim_num) ) * axis(1:dim_num)';
%
%  Case 1: Below bottom cap.
%
  if ( p_dot_axis <= 0.0 )

    distance = disk_point_dist_3d ( p1, r, axis, p );
%
%  Case 2: between cylinder planes.
%
  elseif ( p_dot_axis <= axis_length )
    
    p_length = r8vec_norm ( dim_num, p(1:dim_num) - p1(1:dim_num) );
    off_axis_component = sqrt ( p_length.^2 - p_dot_axis.^2 );
    
    distance = off_axis_component - r;
    
    if ( distance < 0.0 )
      distance = max ( distance, p_dot_axis - axis_length );
      distance = max ( distance, -p_dot_axis );
    end
%
%  Case 3: Above the top cap.
%
  elseif ( axis_length < p_dot_axis )

    distance = disk_point_dist_3d ( p2, r, axis, p );

  end

  return
end
