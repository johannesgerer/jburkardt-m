function quad_mesh_test03 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST03 demonstrates AREA_QUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2009
%
%  Author:
%
%    John Burkardt
%
  quad_xy = [ ...
    1.0, 2.0;
    5.0, 2.0;
    5.0, 3.0;
    4.0, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST03\n' );
  fprintf ( 1, '  AREA_QUAD computes the area of a quadrilateral.\n' );

  area = area_quad ( quad_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Area = %f\n', area );

  return
end
