function triangulation_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests TRIANGULATION_ORDER6_VERTEX_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%  
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_VERTEX_COUNT counts the \n' );
  fprintf ( 1, '  vertex nodes and midside nodes in\n' );
  fprintf ( 1, '  an order 6 triangulation.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example1_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example1 ( node_num, triangle_num );

  [ vertex_num, midside_num ] = triangulation_order6_vertex_count ( ...
    node_num, triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes         = %d\n', node_num );
  fprintf ( 1, '  Number of vertex nodes  = %d\n', vertex_num );
  fprintf ( 1, '  Number of midside nodes = %d\n', midside_num );

  return
end
