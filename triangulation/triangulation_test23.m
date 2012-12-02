function triangulation_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests TRIANGULATION_ORDER6_BOUNDARY_EDGE_COUNT.
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
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_BOUNDARY_EDGE_COUNT counts the\n' );
  fprintf ( 1, '    boundary edges in an order 6 triangulation.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example1_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example1 ( node_num, triangle_num );

  boundary_edge_num = triangulation_order6_boundary_edge_count ( ...
    triangle_num, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of boundary edges = %d\n', boundary_edge_num );
  fprintf ( 1, '  Correct number =           %d\n', 16 );

  return
end
