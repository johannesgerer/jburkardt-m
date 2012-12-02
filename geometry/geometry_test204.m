function geometry_test204 ( )

%*****************************************************************************80
%
%% TEST204 tests TMAT_INIT, TMAT_ROT_AXIS, TMAT_ROT_VECTOR, TMAT_SCALE,s TMAT_SHEAR, TMAT_TRANS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST204\n' );
  fprintf ( 1, '  TMAT geometric transformation matrix routines:\n' );
  fprintf ( 1, '  TMAT_INIT initializes,\n' );
  fprintf ( 1, '  TMAT_ROT_AXIS for rotation about an axis,\n' );
  fprintf ( 1, '  TMAT_ROT_VECTOR for rotation about a vector,\n' );
  fprintf ( 1, '  TMAT_SCALE for scaling,\n' );
  fprintf ( 1, '  TMAT_SHEAR for shear,\n' );
  fprintf ( 1, '  TMAT_TRANS for translation\n' );
%
%  Initialization.
%
  a = tmat_init ( );

  r8mat_print ( 4, 4, a, '  Initial transformation matrix:' );
%
%  Rotation about an axis.
%
  angle = 30.0;
  axis1 = 'x';
  b = tmat_rot_axis ( a, angle, axis1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Transformation matrix for\n' );
  fprintf ( 1, '  rotation about %s\n', axis1 );
  fprintf ( 1, '  by %f\n' , angle );

  r8mat_print ( 4, 4, b, ' ' );
%
%  Rotation about a vector.
%
  angle = 30.0;
  axis(1:dim_num) = [ 1.0, 2.0, 3.0 ];
  b = tmat_rot_vector ( a, angle, axis );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Transformation matrix for\n' );
  fprintf ( 1, '  rotation about %f  %f  %f\n', axis(1:dim_num) );
  fprintf ( 1, '  of %f\n', angle );

  r8mat_print ( 4, 4, b, ' ' );
%
%  Scaling.
%
  v(1:3) = [ 2.0, 0.5, 10.0 ];
  b = tmat_scale ( a, v );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Transformation matrix for\n' );
  fprintf ( 1, '  scaling by %f  %f  %f\n', v(1:3) );

  r8mat_print ( 4, 4, b, ' ' );
%
%  Shear.
%
  axis2 = 'xy';
  s = 0.5;
  b = tmat_shear ( a, axis2, s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Transformation matrix for\n' );
  fprintf ( 1, '  %s\n', axis2 );
  fprintf ( 1, '  shear coefficient of %f\n', s );

  r8mat_print ( 4, 4, b, ' ' );
%
%  Translation.
%
  v(1:3) = [ 1.0, 2.0, 3.0 ];
  b = tmat_trans ( a, v );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Transformation matrix for\n' );
  fprintf ( 1, '  translation by %f  %f  %f\n', v(1:3) );

  r8mat_print ( 4, 4, b, ' ' );

  return
end
