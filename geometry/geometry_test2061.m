function geometry_test2061 ( )

%*****************************************************************************80
%
%% TEST2061 tests TRIANGLE_AREA_2D;
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
  dim_num = 2;

  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2061\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_AREA_2D computes the area;\n' );

  r8mat_print ( dim_num, 3, t, '  Triangle vertices (columns)' );

  area = triangle_area_2d ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle area is %f\n', area );

  return
end
