function test1712 ( )

%*****************************************************************************80
%
%% TEST1712 tests QUAD_AREA_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2010
%
%  Author:
%
%    John Burkardt
%
  q = [ ...
    2.0, 2.0, 0.0; ...
    0.0, 0.0, 0.0; ...
    1.0, 1.0, 1.0; ...
    3.0, 3.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1712\n' );
  fprintf ( 1, '  For a quadrilateral in 3D:\n' );
  fprintf ( 1, '  QUAD_AREA_3D finds the area.\n' );

  r8mat_transpose_print ( 3, 4, q, '  The vertices:' );

  area = quad_area_3d ( q );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUAD_AREA_3D area is     %f\n', area );

  t(1:3,1:3) = q(1:3,1:3);
  area1 = triangle_area_3d ( t );
  t(1:3,1:2) = q(1:3,3:4);
  t(1:3,  3) = q(1:3,1  );
  area2 = triangle_area_3d ( t );
  fprintf ( 1, '  Sum of TRIANGLE_AREA_3D: %f\n', area1 + area2 );

  return
end
