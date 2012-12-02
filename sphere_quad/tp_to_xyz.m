function v = tp_to_xyz ( theta, phi )

%*****************************************************************************80
%
%% TP_TO_XYZ converts spherical TP coordinates to XYZ coordinates.
%
%  Discussion:
%
%    The point is assume to lie on the unit sphere centered at the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real THETA, PHI, the angular coordinates of a point
%    on the unit sphere.
%
%    Output, real V(3), the XYZ coordinates.
%
  v(1) = cos ( theta ) * sin ( phi );
  v(2) = sin ( theta ) * sin ( phi );
  v(3) =                 cos ( phi );

  return
end