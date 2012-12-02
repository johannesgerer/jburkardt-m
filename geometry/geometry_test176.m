function geometry_test176 ( )

%*****************************************************************************80
%
%% TEST176 tests ROTATION_AXIS2MAT_3D, ROTATION_MAT2AXIS_3D.
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
  fprintf ( 1, 'TEST176\n' );
  fprintf ( 1, '  ROTATION_MAT2AXIS_3D computes a rotation axis\n' );
  fprintf ( 1, '    and angle from a rotation matrix.\n' );
  fprintf ( 1, '  ROTATION_AXIS2MAT_3D computes a rotation matrix\n' );
  fprintf ( 1, '    from a rotation axis and angle.\n' );

  r8mat_print ( dim_num, dim_num, a, '  The rotation matrix:' );

  [ axis, angle ] = rotation_mat2axis_3d ( a );

  r8vec_print ( dim_num, axis, '  The rotation axis:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rotation angle is %f\n', angle );

  a = rotation_axis2mat_3d ( axis, angle );

  r8mat_print ( dim_num, dim_num, a, '  The rotation matrix:' );

  return
end
