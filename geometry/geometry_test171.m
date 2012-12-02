function geometry_test171 ( )

%*****************************************************************************80
%
%% TEST171 tests QUAD_AREA_2D and QUAD_AREA2_2D;
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
    0.0D+00, 0.0D+00; ...
    1.0D+00, 0.0D+00; ...
    1.0D+00, 1.0D+00; ...
    0.0D+00, 1.0D+00 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST171\n' );
  fprintf ( 1, '  For a quadrilateral in 2D:\n' );
  fprintf ( 1, '  QUAD_AREA_2D finds the area;\n' );
  fprintf ( 1, '  QUAD_AREA2_2D finds the area;\n' );

  r8mat_transpose_print ( 2, 4, q, '  The vertices:' );

  area = quad_area_2d ( q );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUAD_AREA_2D area is  %f\n', area );
 
  area = quad_area2_2d ( q );

  fprintf ( 1, '  QUAD_AREA2_2D area is %f\n', area );

  return
end
