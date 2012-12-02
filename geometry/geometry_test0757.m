function geometry_test0757 ( )

%*****************************************************************************80
%
%% TEST0757 tests POLYGON_ANGLES_2D.
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
  dim_num = 2;
  n = 6;

  v = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    2.0, 1.0; ...
    3.0, 0.0; ...
    3.0, 2.0; ...
    1.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0757\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_ANGLES_2D computes the angles.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of polygonal vertices = %d\n', n );

  r8mat_transpose_print ( dim_num, n, v, '  The polygon vertices:' );

  angle = polygon_angles_2d ( n, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polygonal angles in degrees:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, radians_to_degrees ( angle(i) ) );
  end

  return
end
