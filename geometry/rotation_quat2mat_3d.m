function a = rotation_quat2mat_3d ( q )

%*****************************************************************************80
%
%% ROTATION_QUAT2MAT_3D converts a rotation from quaternion to matrix format in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
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
%    Input, real Q(4), the quaternion representing the rotation.
%
%    Output, real A(3,3), the rotation matrix.
%
  dim_num = 3;

  sin_phi = sqrt ( sum ( q(2:4).^2 ) );

  cos_phi = q(1);

  angle = 2.0 * atan2 ( sin_phi, cos_phi );

  if ( sin_phi == 0.0 )
    v1 = 1.0;
    v2 = 0.0;
    v3 = 0.0;
  else
    v1 = q(2) / sin_phi;
    v2 = q(3) / sin_phi;
    v3 = q(4) / sin_phi;
  end

  ca = cos ( angle );
  sa = sin ( angle );

  a(1,1) =                v1 * v1 + ca * ( 1.0 - v1 * v1 );
  a(1,2) = ( 1.0 - ca ) * v1 * v2 - sa * v3;
  a(1,3) = ( 1.0 - ca ) * v1 * v3 + sa * v2;

  a(2,1) = ( 1.0 - ca ) * v2 * v1 + sa * v3;
  a(2,2) =                v2 * v2 + ca * ( 1.0 - v2 * v2 );
  a(2,3) = ( 1.0 - ca ) * v2 * v3 - sa * v1;

  a(3,1) = ( 1.0 - ca ) * v3 * v1 - sa * v2;
  a(3,2) = ( 1.0 - ca ) * v3 * v2 + sa * v1;
  a(3,3) =                v3 * v3 + ca * ( 1.0 - v3 * v3 );

  return
end
