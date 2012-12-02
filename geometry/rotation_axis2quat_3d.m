function q = rotation_axis2quat_3d ( axis, angle )

%*****************************************************************************80
%
%% ROTATION_AXIS2QUAT_3D converts a rotation from axis to quaternion format in 3D.
%
%  Discussion:
%
%    A rotation quaternion Q has the form:
%
%      Q = A + Bi + Cj + Dk
%
%    where A, B, C and D are real numbers, and i, j, and k are to be regarded
%    as symbolic constant basis vectors, similar to the role of the "i"
%    in the representation of imaginary numbers.
%
%    A is the cosine of half of the angle of rotation.  (B,C,D) is a
%    unit vector pointing in the direction of the axis of rotation.
%    Rotation multiplication and inversion can be carried out using
%    this format and the usual rules for quaternion multiplication
%    and inversion.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real AXIS(3), the axis vector which remains 
%    unchanged by the rotation.
%
%    Input, real ANGLE, the angular measurement of the 
%    rotation about the axis, in radians.
%
%    Output, real Q(4), the quaternion representing the rotation.
%
  dim_num = 3;

  axis_norm = sqrt ( sum ( axis(1:dim_num).^2 ) );

  if ( axis_norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ROTATION_AXIS2QUAT_3D - Fatal error!\n' );
    fprintf ( 1, '  The axis vector is null.\n' );
    q(1:4) = 0.0;
    return
  end

  q(1)   = cos ( 0.5 * angle );
  q(2:4) = sin ( 0.5 * angle ) * axis(1:3) / axis_norm;

  return
end
