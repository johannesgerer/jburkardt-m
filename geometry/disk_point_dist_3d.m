function dist = disk_point_dist_3d ( pc, r, axis, p )

%*****************************************************************************80
%
%% DISK_POINT_DIST_3D determines the distance from a disk to a point in 3D.
%
%  Discussion:
%
%    A disk in 3D satisfies the equations:
%
%      ( P(1) - PC(1) )**2 + ( P(2) - PC(2) )**2 + ( P(3) - PC(3) <= R**2
%
%    and
%
%      P(1) * AXIS(1) + P(2) * AXIS(2) + P(3) * AXIS(3) = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PC(3), the center of the disk.
%
%    Input, real R, the radius of the disk.
%
%    Input, real AXIS(3), the axis vector.
%
%    Input, real P(3), the point to be checked.
%
%    Output, real DIST, the distance of the point to the disk.
%
  dim_num = 3;
%
%  Special case: the point is the center.
%
  if ( p(1:dim_num) == pc(1:dim_num) )
    dist = 0.0;
    return
  end

  axis_length = r8vec_norm ( dim_num, axis(1:dim_num) );

  if ( axis_length == 0.0 )
    dist = -Inf;
    return
  end

  axis(1:dim_num) = axis(1:dim_num) / axis_length;
  
  axial_component = ( p(1:dim_num) - pc(1:dim_num) ) * axis(1:dim_num)';
%
%  Special case: the point satisfies the disk equation exactly.
%
  if ( sum ( p(1:dim_num) - pc(1:dim_num) ).^2 <= r * r & ...
    axial_component == 0.0 )
    dist = 0.0;
    return
  end
%
%  Decompose P-PC into axis component and off-axis component.
%
  off_axis(1:dim_num) = p(1:dim_num) - pc(1:dim_num) ...
    - axial_component * axis(1:dim_num);

  off_axis_component = r8vec_norm ( dim_num, off_axis );
%
%  If the off-axis component has norm less than R, the nearest point is
%  the projection to the disk along the axial direction, and the distance
%  is just the dot product of P-PC with unit AXIS.
%
  if ( off_axis_component <= r )
    dist = abs ( axial_component );
    return
  end
%
%  Otherwise, the nearest point is along the perimeter of the disk.
%
  dist = sqrt ( axial_component.^2 + ( off_axis_component - r ).^2 );

  return
end
