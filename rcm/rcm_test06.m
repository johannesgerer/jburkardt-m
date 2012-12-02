function rcm_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests LEVEL_SET;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2007
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  LEVEL_SET computes the level sets of a graph,\n' );
  fprintf ( 1, '  given a root node (which defines level 1).\n' );
 
  [ node_num, adj_num ] = graph_01_size ( );

  [ adj_row, adj ] = graph_01_adj ( node_num, adj_num );

  adj_print ( node_num, adj_num, adj_row, adj, '  Adjacency matrix:' );

  adj_show ( node_num, adj_num, adj_row, adj );
%
%  Choose different roots.
%
  for i = 1 : 3

    [ root, seed ] = i4_uniform ( 1, node_num, seed );

    mask(1:node_num) = 1;

    [ mask, level_num, level_row, level ] = level_set ( root, adj_num, ...
      adj_row, adj, mask, node_num );

    level_set_print ( node_num, level_num, level_row, level );

  end

  return
end
