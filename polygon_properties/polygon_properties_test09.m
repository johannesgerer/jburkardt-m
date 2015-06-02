function polygon_properties_test09 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST09 tests POLYGON_INTEGRAL_*.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  v = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST09\n' );
  fprintf ( 1, '  For a polygon:\n' );
  fprintf ( 1, '  POLYGON_INTEGRAL_1 integrates 1\n' );
  fprintf ( 1, '  POLYGON_INTEGRAL_X integrates X\n' );
  fprintf ( 1, '  POLYGON_INTEGRAL_Y integrates Y\n' );
  fprintf ( 1, '  POLYGON_INTEGRAL_XX integrates X*X\n' );
  fprintf ( 1, '  POLYGON_INTEGRAL_XY integrates X*Y\n' );
  fprintf ( 1, '  POLYGON_INTEGRAL_YY integrates Y*Y\n' );

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X,Y)    Integral\n' );
  fprintf ( 1, '\n' );

  result = polygon_integral_1 ( n, v );
  fprintf ( 1, '  1    %14.6g\n', result );

  result = polygon_integral_x ( n, v );
  fprintf ( 1, '  X    %14.6g\n', result );

  result = polygon_integral_y ( n, v );
  fprintf ( 1, '  Y    %14.6g\n', result );

  result = polygon_integral_xx ( n, v );
  fprintf ( 1, 'X*X    %14.6g\n', result );

  result = polygon_integral_xy ( n, v );
  fprintf ( 1, 'X*Y    %14.6g\n', result );

  result = polygon_integral_yy ( n, v );
  fprintf ( 1, 'Y*Y    %14.6g\n', result );

  return
end
