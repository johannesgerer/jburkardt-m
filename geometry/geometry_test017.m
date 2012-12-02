function geometry_test017 ( )

%*****************************************************************************80
%
%% TEST017 tests CIRCLE_IMP_POINTS_ARC_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  n = 13;
  dim_num = 2;
  center(1:2,1) = [ 5.0; -2.0 ];
  r = 2.0;
  theta1 = pi / 2.0;
  theta2 = 3.0 * pi / 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST017\n' );
  fprintf ( 1, '  CIRCLE_IMP_POINTS_ARC_2D returns points on a\n' );
  fprintf ( 1, '  circular arc.\n' );

  circle_imp_print_2d ( r, center, '  The implicit circle:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The arc extends from THETA1 = %f\n', theta1 );
  fprintf ( 1, '  to THETA2 = %f\n', theta2 );

  p = circle_imp_points_arc_2d ( r, center, theta1, theta2, n );

  r8mat_transpose_print ( dim_num, n, p, '  Sample results:' );

  return
end
