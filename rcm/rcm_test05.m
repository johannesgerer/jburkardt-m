function rcm_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests GRAPH_01_ADJ and GRAPH_01_SIZE;
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  GRAPH_01_SIZE returns the sizes for graph 1.\n' );
  fprintf ( 1, '  GRAPH_01_ADJ returns the adjacency for graph 1.\n' );
  fprintf ( 1, '  ADJ_PRINT prints the adjacency information.\n' );
 
  [ node_num, adj_num ] = graph_01_size ( );

  [ adj_row, adj ] = graph_01_adj ( node_num, adj_num );

  adj_print ( node_num, adj_num, adj_row, adj, ...
    '  Adjacency for GRAPH_01:' );

  adj_show ( node_num, adj_num, adj_row, adj );

  return
end
