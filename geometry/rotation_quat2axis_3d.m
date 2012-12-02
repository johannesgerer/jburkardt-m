function [ axis, angle ] = rotation_quat2axis_3d ( q )

%*****************************************************************************80
%
%% ROTATION_QUAT2AXIS_3D converts a rotation from quaternion to axis format in 3D.
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
%    vector pointing in the direction of the axis of rotation.
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
%    26 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Q(4), the quaternion representing the rotation.
%
%    Output, real AXIS(3), the axis vector which remains 
%    unchanged by the rotation.
%
%    Output, real ANGLE, the angular measurement of the 
%    rotation about the axis, in radians.
%
  dim_num = 3;

  sin_phi = sqrt ( sum ( q(2:4).^2 ) );

  cos_phi = q(1);

  angle = 2.0 * atan2 ( sin_phi, cos_phi );

  if ( sin_phi == 0.0 )
    axis(1:dim_num) = [ 1.0, 0.0, 0.0 ];
  else
    axis(1:dim_num) = q(2:4) / sin_phi;
  end

  return
end
