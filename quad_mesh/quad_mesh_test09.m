function quad_mesh_test09 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST09 writes data to files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST09\n' );
  fprintf ( 1, '  Write Q4 Mesh Example #2 to files.\n' );

  [ node_num, element_num, hole_num ] = example2_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example2_q4_mesh ( ...
    node_num, element_num );

  output_filename = 'q4_mesh_ex2_element_neighbors.txt';
  i4mat_write ( output_filename, 4, element_num, element_neighbor );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element neighbors written to "%s".\n', output_filename );

  output_filename = 'q4_mesh_ex2_elements.txt';
  i4mat_write ( output_filename, 4, element_num, element_node )
  fprintf ( 1, '  Elements written to "%s".\n', output_filename );

  output_filename = 'q4_mesh_ex2_xy.txt';
  r8mat_write ( output_filename, 2, node_num, node_xy )
  fprintf ( 1,'  Node coordinates written to "%s".\n', output_filename );

  return
end
