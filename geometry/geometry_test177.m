function geometry_test177 ( )

%*****************************************************************************80
%
%% TEST177 tests ROTATION_AXIS2QUAT_3D, ROTATION_QUAT2AXIS_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  angle = 1.159804;
  axis(1:dim_num) = [ 0.2361737, -0.8814124, -0.4090649 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST177\n' );
  fprintf ( 1, '  ROTATION_QUAT2AXIS_3D computes a rotation axis\n' );
  fprintf ( 1, '    and angle from a rotation quaternion.\n' );
  fprintf ( 1, '  ROTATION_AXIS2QUAT_3D computes a rotation\n' );
  fprintf ( 1, '    quaternion from a rotation axis and angle.\n' );

  r8vec_print ( dim_num, axis, '  Rotation axis:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rotation angle is %f\n', angle );

  q = rotation_axis2quat_3d ( axis, angle );

  r8vec_print ( 4, q, '  The rotation quaternion:' );

  [ axis, angle ] = rotation_quat2axis_3d ( q );

  r8vec_print ( dim_num, axis, '  The rotation axis:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rotation angle is %f\n', angle );

  return
end
