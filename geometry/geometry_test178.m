function geometry_test178 ( )

%*****************************************************************************80
%
%% TEST178 tests ROTATION_MAT2QUAT_3D, ROTATION_QUAT2MAT_3D.
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

  a = [ ...
    0.43301269, -0.5,        0.75; ...
    0.25,        0.86602539, 0.43301269; ...
   -0.86602539,  0.0,        0.5 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST178\n' );
  fprintf ( 1, '  ROTATION_MAT2QUAT_3D computes a rotation\n' );
  fprintf ( 1, '    quaternion from a rotation matrix.\n' );
  fprintf ( 1, '  ROTATION_QUAT2MAT_3D computes a rotation matrix\n' );
  fprintf ( 1, '    from a rotation quaternion.\n' );

  r8mat_print ( dim_num, dim_num, a, '  The rotation matrix:' );

  q = rotation_mat2quat_3d ( a );

  r8vec_print ( 4, q, '  The rotation quaternion:' );

  a = rotation_quat2mat_3d ( q );

  r8mat_print ( dim_num, dim_num, a, '  The rotation matrix:' );

  return
end
