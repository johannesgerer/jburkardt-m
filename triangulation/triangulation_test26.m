function triangulation_test26 ( )

%*****************************************************************************80
%
%% TEST26 tests TRIANGULATION_ORDER6_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST26\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_PRINT prints out\n' );
  fprintf ( 1, '  an order6 triangulation.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example1_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example1 ( node_num, triangle_num );

  triangulation_order6_print ( node_num, triangle_num, node_xy, ...
    triangle_node, triangle_neighbor );

  return
end
