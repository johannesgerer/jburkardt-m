function a = rotation_axis2mat_3d ( axis, angle )

%*****************************************************************************80
%
%% ROTATION_AXIS2MAT_3D converts a rotation from axis to matrix format in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics, Principles and Practice,
%    Addison Wesley, Second Edition, 1990.
%
%  Parameters:
%
%    Input, real AXIS(3), the axis vector which remains 
%    unchanged by the rotation.
%
%    Input, real ANGLE, the angular measurement of the
%    rotation about the axis, in radians.
%
%    Output, real A(3,3), the rotation matrix.
%
  dim_num = 3;

  axis_norm = sqrt ( sum ( axis(1:dim_num).^2 ) );

  if ( axis_norm == 0.0 )
    a(1:dim_num,1:dim_num) = 0.0;
    return
  end

  axis(1:dim_num) = axis(1:dim_num) / axis_norm;

  ca = cos ( angle );
  sa = sin ( angle );

  a(1,1) =                axis(1) * axis(1) + ca * ( 1.0 - axis(1) * axis(1) );
  a(1,2) = ( 1.0 - ca ) * axis(1) * axis(2) - sa * axis(3);
  a(1,3) = ( 1.0 - ca ) * axis(1) * axis(3) + sa * axis(2);

  a(2,1) = ( 1.0 - ca ) * axis(2) * axis(1) + sa * axis(3);
  a(2,2) =                axis(2) * axis(2) + ca * ( 1.0 - axis(2) * axis(2) );
  a(2,3) = ( 1.0 - ca ) * axis(2) * axis(3) - sa * axis(1);

  a(3,1) = ( 1.0 - ca ) * axis(3) * axis(1) - sa * axis(2);
  a(3,2) = ( 1.0 - ca ) * axis(3) * axis(2) + sa * axis(1);
  a(3,3) =                axis(3) * axis(3) + ca * ( 1.0 - axis(3) * axis(3) );

  return
end
