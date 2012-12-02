function geometry_test202 ( )

%*****************************************************************************80
%
%% TEST202 tests SUPER_ELLIPSE_POINTS_2D;
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
  n = 24;
  dim_num = 2;

  center(1:dim_num) = [ 5.0, -2.0 ];
  r1 = 3.0;
  r2 = 1.0;
  expo = 1.5;
  psi = pi / 6.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST202\n' );
  fprintf ( 1, '  SUPER_ELLIPSE_POINTS_2D returns points on a super ellipse;\n' );

  r8vec_print ( dim_num, center, '  Superellipse center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  radii R1 = %f, R2 = %f\n', r1, r2 );
  fprintf ( 1, '  exponent EXPO = %f\n', expo );
  fprintf ( 1, '  and angle PSI = %f\n', psi );

  p = super_ellipse_points_2d ( center, r1, r2, expo, psi, n );

  r8mat_transpose_print ( dim_num, n, p, '  Sample points:' );
 
   return
end
