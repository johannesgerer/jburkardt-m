function rcm_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests ROOT_FIND;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2007
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  ROOT_FIND is given a node in the graph,\n' );
  fprintf ( 1, '  and returns a better node to use as a starting\n' );
  fprintf ( 1, '  point for reordering.\n' );

  [ node_num, adj_num ] = graph_01_size ( );

  [ adj_row, adj] = graph_01_adj ( node_num, adj_num );

  adj_print ( node_num, adj_num, adj_row, adj, '  Adjacency matrix:' );

  adj_show ( node_num, adj_num, adj_row, adj );

  for i = 1 : node_num

    root = i;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Starting root =    %d\n', root );

    mask(1:node_num) = 1;

    [ root, level_num, level_row, level ] = root_find ( root, ...
      adj_num, adj_row, adj, mask, node_num );

    fprintf ( 1, '  Suggested root =   %d\n', root );
    fprintf ( 1, '  Number of levels = %d\n', level_num );

  end

  return
end
