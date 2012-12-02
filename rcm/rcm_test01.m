function rcm_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests ADJ_SET.
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
  node_num = 10;
  adj_max = node_num * ( node_num - 1 );
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  ADJ_SET sets up an adjacency matrix incrementally.\n' );
 
  [ n_calls, seed ] = i4_uniform ( 1, adj_max, seed );

  adj_num = 0;
  adj_row = [];
  adj = [];

  [ adj_num, adj_row, adj ] = adj_set ( node_num, adj_max, adj_num, ...
    adj_row, adj, -1, -1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating and recording adjacency information:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : n_calls

    [ i, seed ] = i4_uniform ( 1, node_num, seed );
    [ j, seed ] = i4_uniform ( 1, node_num, seed );

    fprintf ( 1, '  %6d  %6d\n', i, j );

    [ adj_num, adj_row, adj ] = adj_set ( node_num, adj_max, adj_num, ...
      adj_row, adj, i, j );

  end

  adj_print ( node_num, adj_num, adj_row, adj, ...
    '  Random adjacency matrix:' );

  adj_show ( node_num, adj_num, adj_row, adj );

  return
end
