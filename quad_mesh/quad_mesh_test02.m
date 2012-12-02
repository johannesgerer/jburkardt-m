function quad_mesh_test02 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST02 tests AREA_Q4_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST02\n' );
  fprintf ( 1, '  AREA_Q4_MESH computes the area of each element\n' );
  fprintf ( 1, '  in a Q4 mesh.\n' );

  [ node_num, element_num, hole_num ] = example2_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example2_q4_mesh ( ...
    node_num, element_num );

  [ element_area, mesh_area ] = area_q4_mesh ( node_num, element_num, ...
    node_xy, element_node );

  r8vec_print ( element_num, element_area, '  Element areas:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   Mesh =   %f\n', mesh_area );

  return
end
