function geometry_test205 ( )

%*****************************************************************************80
%
%% TEST205 tests TMAT_MXP2.
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
  n = 4;
  dim_num = 3;

  point = [ ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0; ...
    1.0, 1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST205\n' );
  fprintf ( 1, '  TMAT_MXP2 applies a geometric transformation\n' );
  fprintf ( 1, '  matrix to a set of points.\n' );

  r8mat_transpose_print ( 3, n, point, '  Points:' );
%
%  Initialization of transformation matrix.
%
  a = tmat_init ( );

  r8mat_print ( 4, 4, a, '  Initial transformation matrix:' );
%
%  Rotation about an axis.
%
  angle = 30.0;
  axis1 = 'x';
  b = tmat_rot_axis ( a, angle, axis1 );

  point2 = tmat_mxp2 ( b, n, point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rotation about %s\n', axis1 );
  fprintf ( 1, '  by %f\n' , angle );

  r8mat_transpose_print ( 3, n, point2, ' ' );
%
%  Rotation about a vector.
%
  angle = 30.0;
  axis(1:3) = [ 1.0, 2.0, 3.0 ];

  b = tmat_rot_vector ( a, angle, axis );

  point2 = tmat_mxp2 ( b, n, point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rotation about %f  %f  %f\n', axis(1:3) );
  fprintf ( 1, '  of %f\n', angle );

  r8mat_transpose_print ( 3, n, point2, ' ' );
%
%  Scaling.
%
  v(1:3) = [ 2.0, 0.5, 10.0 ];
  b = tmat_scale ( a, v );
  
  point2 = tmat_mxp2 ( b, n, point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Scaling by %f  %f  %f\n', v(1:3) );

  r8mat_transpose_print ( 3, n, point2, ' ' );
%
%  Shear.
%
  axis2 = 'xy';
  s = 0.5;
  b = tmat_shear ( a, axis2, s );

  point2 = tmat_mxp2 ( b, n, point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %s\n', axis2 );
  fprintf ( 1, ' shear coefficient of %f\n', s );

  r8mat_transpose_print ( 3, n, point2, ' ' );
%
%  Translation.
%
  v(1:3) = [ 1.0, 2.0, 3.0 ];
  b = tmat_trans ( a, v );

  point2 = tmat_mxp2 ( b, n, point );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Translation by %f  %f  %f\n', v(1:3) );

  r8mat_transpose_print ( 3, n, point2, ' ' );

  return
end
