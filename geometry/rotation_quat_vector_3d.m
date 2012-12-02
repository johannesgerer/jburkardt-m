function w = rotation_quat_vector_3d ( q, v )

%*****************************************************************************80
%
%% ROTATION_QUAT_VECTOR_3D applies a quaternion rotation to a vector in 3D.
%
%  Discussion:
%
%    If Q is a unit quaternion that encodes a rotation of ANGLE
%    radians about the vector AXIS, then for an arbitrary real
%    vector V, the result W of the rotation on V can be written as:
%
%      W = Q * V * Conj(Q)
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
%  Parameters:
%
%    Input, real Q(4), the quaternion defining the rotation.
%
%    Input, real V(3), the vector to be rotated.
%
%    Output, real W(3), the rotated vector.
%
  dim_num = 3;

  w(1) = ...
         ( 2.0 * ( q(1) * q(1) + q(2) * q(2) ) - 1.0 ) * v(1) ...
       +   2.0 * ( q(2) * q(3) - q(1) * q(4) )         * v(2) ...
       +   2.0 * ( q(2) * q(4) + q(1) * q(3) )         * v(3);

  w(2) = ...
           2.0 * ( q(2) * q(3) + q(1) * q(4) )         * v(1) ...
       + ( 2.0 * ( q(1) * q(1) + q(3) * q(3) ) - 1.0 ) * v(2) ...
       +   2.0 * ( q(3) * q(4) - q(1) * q(2) )         * v(3);

  w(3) = ...
           2.0 * ( q(2) * q(4) - q(1) * q(3) )         * v(1) ...
       +   2.0 * ( q(3) * q(4) + q(1) * q(2) )         * v(2) ...
       + ( 2.0 * ( q(1) * q(1) + q(4) * q(4) ) - 1.0 ) * v(3);

  return
end
