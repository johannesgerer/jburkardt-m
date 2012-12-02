function triangulation_refine_local_test ( )

%*****************************************************************************80
%
%% TRIANGULATION_REFINE_LOCAL_TEST tests TRIANGULATION_REFINE_LOCAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_REFINE_LOCAL_TEST\n' );
  fprintf ( 1, '  TRIANGULATION_REFINE_LOCAL locally refines a triangulation.\n' );

  prefix = 'ell3';

  [ node_num, element_num, node_xy, element_node, element_neighbor ] = ...
    grid_read ( prefix );

  r8mat_transpose_print ( 2, node_num, node_xy, '  Node coordinates' );
  i4mat_transpose_print ( 3, element_num, element_node, '  Element node array:' );
  i4mat_transpose_print ( 3, element_num, element_neighbor, '  Element neighbor array' );

  element = 11;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Refine element %d\n', element );

  [ node_num2, element_num2, node_xy2, element_node2, ...
    element_neighbor2 ] = triangulation_refine_local ( node_num, ...
    element_num, node_xy, element_node, element_neighbor, element );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Refined number of nodes =          %d\n', node_num2 );
  fprintf ( 1, '  Refined number of elements =       %d\n', element_num2 );

  r8mat_transpose_print ( 2, node_num2, node_xy2, '  Refined node coordinates' );
  i4mat_transpose_print ( 3, element_num2, element_node2, '  Refined element node array:' );
  i4mat_transpose_print ( 3, element_num2, element_neighbor2, '  Refined element neighbor array' );
%
%  Write out the refined data.
%
  node_refined_filename = strcat ( prefix, '_refined_nodes.txt' );
  element_refined_filename = strcat ( prefix, '_refined_elements.txt' );
  element_neighbor_refined_filename = strcat ( prefix, '_refined_element_neighbors.txt' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Refined node file is "%s".\n', node_refined_filename );
  fprintf ( 1, '  Refined element file is "%s".\n', element_refined_filename );
  fprintf ( 1, '  Refined element neighbor file is "%s".\n', element_neighbor_refined_filename );

  r8mat_write ( node_refined_filename, 2, node_num2, node_xy2 );
  i4mat_write ( element_refined_filename, 3, element_num2, element_node2 );
  i4mat_write ( element_neighbor_refined_filename, 3, element_num2, element_neighbor2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_REFINE_LOCAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
