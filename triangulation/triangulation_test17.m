function triangulation_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests TRIANGULATION_ORDER3_EXAMPLE1.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_EXAMPLE1_SIZE gives the sizes\n' );
  fprintf ( 1, '    for an example triangulation;\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_EXAMPLE1 returns the information\n' );
  fprintf ( 1, '    for an example triangulation;\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_PRINT prints a triangulation.\n' );
%
%  Get the sizes.
%
  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order3_example1_size ( );
%
%  Get the data.
%
  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order3_example1 ( node_num, triangle_num );

  triangulation_order3_print ( node_num, triangle_num, node_xy, ...
    triangle_node, triangle_neighbor );

  return
end
