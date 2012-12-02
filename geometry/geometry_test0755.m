function geometry_test0755 ( )

%*****************************************************************************80
%
%% TEST0755 tests POLYGON_1_2D, POLYGON_X_2D, POLYGON_Y_2D, POLYGON_XX_2D, POLYGON_XY_2D and POLYGON_YY_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  dim_num = 2;

  v = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0755\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_1_2D integrates 1\n' );
  fprintf ( 1, '  POLYGON_X_2D integrates X\n' );
  fprintf ( 1, '  POLYGON_Y_2D integrates Y\n' );
  fprintf ( 1, '  POLYGON_XX_2D integrates X*X\n' );
  fprintf ( 1, '  POLYGON_XY_2D integrates X*Y\n' );
  fprintf ( 1, '  POLYGON_YY_2D integrates Y*Y\n' );

  r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X,Y)    Integral\n' );
  fprintf ( 1, '\n' );

  result = polygon_1_2d ( n, v );
  fprintf ( 1, '    1  %f\n', result );

  result = polygon_x_2d ( n, v );
  fprintf ( 1, '    X  %f\n', result );

  result = polygon_y_2d ( n, v );
  fprintf ( 1, '    Y  %f\n', result );

  result = polygon_xx_2d ( n, v );
  fprintf ( 1, '  X*X  %f\n', result );

  result = polygon_xy_2d ( n, v );
  fprintf ( 1, '  X*Y  %f\n', result );

  result = polygon_yy_2d ( n, v );
  fprintf ( 1, '  Y*Y  %f\n', result );

  return
end
