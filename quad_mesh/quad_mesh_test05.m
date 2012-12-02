function quad_mesh_test05 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST05 tests BOUNDARY_EDGE_COUNT_EULER_Q4_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST05\n' );
  fprintf ( 1, '  BOUNDARY_EDGE_COUNT_EULER_Q4_MESH counts the\n' );
  fprintf ( 1, '    boundary edges using Euler''s formula.\n' );

  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  boundary_edge_num = boundary_edge_count_euler_q4_mesh ( node_num, ...
    element_num, hole_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of boundary edges = %d\n', boundary_edge_num );
  fprintf ( 1, '  Correct number =           %d\n', 22 );

  return
end
