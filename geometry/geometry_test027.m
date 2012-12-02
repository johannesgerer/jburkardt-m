function geometry_test027 ( )

%*****************************************************************************80
%
%% TEST027 tests ELLIPSE_POINTS_ARC_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 13;
  dim_num = 2;

  center(1:dim_num) = [ 5.0, -2.0 ];
  r1 = 3.0;
  r2 = 1.0;
  psi = pi / 6.0;
  theta1 = pi / 2.0;
  theta2 = 2.0 * pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST027\n' );
  fprintf ( 1, '  ELLIPSE_POINTS_ARC_2D returns points on an\n' );
  fprintf ( 1,'     elliptical arc.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The ellipse has center %f  %f\n', center(1:dim_num) );
  fprintf ( 1, '  radii R1 = %f, R2 = %f\n', r1, r2 );
  fprintf ( 1, '  and angle PSI = %f\n', psi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The arc extends from THETA1 = %f\n', theta1 );
  fprintf ( 1, '  to THETA2 = %f\n', theta2 );

  p = ellipse_points_arc_2d ( center, r1, r2, psi, theta1, theta2, n );

  r8mat_transpose_print ( dim_num, n, p, '  Sample points:' );

  return
end
