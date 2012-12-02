function q = rotation_mat2quat_3d ( a )

%*****************************************************************************80
%
%% ROTATION_MAT2QUAT_3D converts a rotation from matrix to quaternion format in 3D.
%
%  Discussion:
%
%    The computation is based on the fact that a rotation matrix must
%    have an eigenvector corresponding to the eigenvalue of 1, hence:
%
%      ( A - I ) * v = 0.
%
%    The eigenvector V is the axis of rotation.
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
%  Reference:
%
%    Jack Kuipers,
%    Quaternions and Rotation Sequences,
%    Princeton, 1998.
%
%  Parameters:
%
%    Input, real A(3,3), the rotation matrix.
%
%    Output, real Q(4), the quaternion representing the rotation.
%
  dim_num = 3;
%
%  Compute the normalized axis of rotation.
%
  axis(1) = a(3,2) - a(2,3);
  axis(2) = a(1,3) - a(3,1);
  axis(3) = a(2,1) - a(1,2);

  axis_norm = sqrt ( sum ( axis(1:dim_num).^2 ) );

  if ( axis_norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ROTATION_MAT2QUAT_3D - Fatal error!\n' );
    fprintf ( 1, '  A is not a rotation matrix,\n' );
    fprintf ( 1, '  or there are multiple axes of rotation.\n' );
    error ( 'ROTATION_MAT2QUAT_3D - Fatal error!' );
  end

  axis(1:dim_num) = axis(1:dim_num) / axis_norm;
%
%  Compute the angle.
%
  angle = r8_acos ( 0.5 * ( a(1,1) + a(2,2) + a(3,3) - 1.0 ) );
%
%  Compute the quaternion.
%
  cos_phi = cos ( 0.5 * angle );

  sin_phi = sqrt ( 1.0 - cos_phi * cos_phi );

  q(1)   = cos_phi;
  q(2:4) = sin_phi * axis(1:3);

  return
end

