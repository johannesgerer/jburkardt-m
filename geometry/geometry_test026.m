function geometry_test026 ( )

%*****************************************************************************80
%
%% TEST026 tests ELLIPSE_POINTS_2D, ELLIPSE_AREA_2D, POLYGON_AREA_2D.
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
  dim_num = 2;
  nmax = 24;

  center(1:dim_num) = [ 5.0, -2.0 ];
  r1 = 3.0;
  r2 = 1.0;
  psi = pi / 6.0;
  n = 16;

  area = ellipse_area_2d ( r1, r2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026\n' );
  fprintf ( 1, '  ELLIPSE_POINTS_2D returns points on an ellipse;\n' );
  fprintf ( 1, '  ELLIPSE_AREA_2D returns the area of an ellipse;\n' );
  fprintf ( 1, '  POLYGON_AREA_2D finds the area of a polygon.\n' );

  r8vec_print ( dim_num, center, '  Ellipse center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  radii R1 = %f, R2 = %f\n', r1, r2 );
  fprintf ( 1, '  and angle PSI = %f\n', psi );
  fprintf ( 1, '  and area = %f\n', area );

  v = ellipse_points_2d ( center, r1, r2, psi, n );

  r8mat_transpose_print ( dim_num, n, v, '  Sample points:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For any N, the sampled points define a polygon\n' );
  fprintf ( 1, '  whose area approximates the ellipse area.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N      Area\n' );
  fprintf ( 1, '\n' );

  for n = 3 : nmax
    v = ellipse_points_2d ( center, r1, r2, psi, n );
    result = polygon_area_2d ( n, v );
    fprintf ( 1, '  %6d  %14f\n', n, result );
  end

  return
end
