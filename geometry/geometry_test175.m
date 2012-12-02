function geometry_test175 ( )

%*****************************************************************************80
%
%% TEST175 tests ROTATION_AXIS_VECTOR_3D, ROTATION_MAT_VECTOR_3D, ROTATION_QUAT_VECTOR_3D.
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
  axis = [ 0.2361737, -0.8814124, -0.4090649 ];
  v(1:dim_num) = [ 1.0, 4.0, 10.0 ];
%
%  More MATLAB lunacy!
%  v(1:dim_num) = [ 1.0, 4.0, 10.0 ]; makes V a row vector.
%  v(1:dim_num) = [ 1.0, 4.0, 10.0 ]';....ALSO MAKES V A ROW VECTOR.
%  You have your clumsy choice of setting v(1:dim_num,1) = ...
%  or setting v as above and then setting v = v'.  Oh the elegance.
%  Oh, the consistency.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST175\n' );
  fprintf ( 1, '  ROTATION_AXIS_VECTOR_3D applies an axis\n' );
  fprintf ( 1, '    rotation to a vector;\n' );
  fprintf ( 1, '  ROTATION_MAT_VECTOR_3D applies a matrix\n' );
  fprintf ( 1, '    rotation to a vector.\n' );
  fprintf ( 1, '  ROTATION_QUAT_VECTOR_3D applies a quaternion\n' );
  fprintf ( 1, '    rotation to a vector.\n' );

  r8vec_print ( dim_num, v, '  The vector:' );

  r8vec_print ( dim_num, axis, '  The rotation axis:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rotation angle is %f\n', angle );

  w = rotation_axis_vector_3d ( axis, angle, v );

  r8vec_print ( dim_num, w, '  The rotated vector:' );

  a = rotation_axis2mat_3d ( axis, angle );

  r8mat_print ( dim_num, dim_num, a, '  The rotation matrix:' );

  w = rotation_mat_vector_3d ( a, v );

  r8vec_print ( dim_num, w, '  The rotated vector:' );

  q = rotation_axis2quat_3d ( axis, angle );

  r8vec_print ( 4, q, '  The rotation quaternion:' );

  w = rotation_quat_vector_3d ( q, v );

  r8vec_print ( dim_num, w, '  The rotated vector:' );
%
%  Another test of ROTATION_AXIS_VECTOR_3D with an axis vector
%  that does not have unit length.
%
  v(1:3) = [ 1.0, 1.0, 1.0 ];

  r8vec_print ( dim_num, v, '  The vector:' );

  axis(1:3) = [ 0.0, 0.0, 2.0 ];

  r8vec_print ( dim_num, axis, '  The rotation axis:' );

  angle = 90.0;
  angle = degrees_to_radians ( angle );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rotation angle is %f\n', angle );

  w = rotation_axis_vector_3d ( axis, angle, v );

  r8vec_print ( dim_num, w, '  The rotated vector:' );

  return
end
