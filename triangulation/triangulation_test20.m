function triangulation_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests TRIANGULATION_ORDER3_PLOT.
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
  file_name = 'triangulation_order3_plot.eps';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_PLOT can plot a triangulation.\n' );
%
%  Get the sizes.
%
  [ node_num, triangle_num, hole_num ] = ...
    triangulation_order3_example1_size ( );

  [ node_xy, triangle_node, triangle_neighbor ] = ...
    triangulation_order3_example1 ( node_num, triangle_num );

  node_show = 0;
  triangle_show = 1;

  triangulation_order3_plot ( file_name, node_num, node_xy, triangle_num, ...
    triangle_node, node_show, triangle_show );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_PLOT has created an\n' );
  fprintf ( 1, '  Encapsulated PostScript file (EPS) containing\n' );
  fprintf ( 1, '  an image of the triangulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This file is called "%s".\n', file_name );

  return
end
