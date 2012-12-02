function triangulation_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests TRIANGULATION_ORDER6_BOUNDARY_NODE, TRIANGULATION_ORDER6_PLOT.
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
  file_name = 'triangulation_order6_plot.eps';
  dim_num = 2;
  node_show = 2;
  triangle_show = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_BOUNDARY_COUNT counts the boundary\n' );
  fprintf ( 1, '    edges in an arbitrary triangulation.\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER6_PLOT plots the triangulation.\n' );

  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order6_example1_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order6_example1 ( node_num, triangle_num );
%
%  Make the plot.
%
  triangulation_order6_plot ( file_name, node_num, node_xy, triangle_num, ...
    triangle_node, node_show, triangle_show );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  An Encapsulated PostScript image of this\n' );
  fprintf ( 1, '  triangulation is in "%s".\n', file_name );

  node_boundary = triangulation_order6_boundary_node ( node_num, triangle_num, ...
    triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Node  BN?\n' );
  fprintf ( 1, '\n' );

  for i = 1 : node_num
    fprintf ( 1, '  %6d  %1d\n', i, node_boundary(i) );
  end

  return
end
