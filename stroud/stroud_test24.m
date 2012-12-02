function stroud_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests POLYGON_**_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  npts = 4;

  x = [ 0.0, 1.0, 1.0, 0.0 ];
  y = [ 0.0, 0.0, 1.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_1_2D integrates 1\n' );
  fprintf ( 1, '  POLYGON_X_2D integrates X\n' );
  fprintf ( 1, '  POLYGON_Y_2D integrates Y\n' );
  fprintf ( 1, '  POLYGON_XX_2D integrates X**2\n' );
  fprintf ( 1, '  POLYGON_XY_2D integrates X*Y\n' );
  fprintf ( 1, '  POLYGON_YY_2D integrates Y**2\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X,Y)    Integral\n' );
  fprintf ( 1, '\n' );
 
  result = polygon_1_2d ( npts, x, y );
  fprintf ( 1, '     1  %f\n', result );
 
  result = polygon_x_2d ( npts, x, y );
  fprintf ( 1, '     X  %f\n', result );
 
  result = polygon_y_2d ( npts, x, y );
  fprintf ( 1, '     Y  %f\n', result );
 
  result = polygon_xx_2d ( npts, x, y );
  fprintf ( 1, '   X*X  %f\n', result );
 
  result = polygon_xy_2d ( npts, x, y );
  fprintf ( 1, '   X*Y  %f\n', result );
 
  result = polygon_yy_2d ( npts, x, y );
  fprintf ( 1, '   Y*Y  %f\n', result );
 
  return
end
