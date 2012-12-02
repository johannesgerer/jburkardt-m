function rcm_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests GENRCM;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  GENRCM reorders the nodes in a graph using\n' );
  fprintf ( 1, '  the Reverse Cuthill McKee algorithm.\n' );
 
  [ node_num, adj_num ] = graph_01_size ( );

  [ adj_row, adj ] = graph_01_adj ( node_num, adj_num );

  adj_print ( node_num, adj_num, adj_row, adj, '  Adjacency matrix:' );

  adj_show ( node_num, adj_num, adj_row, adj );

  bandwidth = adj_bandwidth ( node_num, adj_num, adj_row, adj );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ADJ bandwidth = %d\n', bandwidth );

  perm = genrcm ( node_num, adj_num, adj_row, adj );

  perm_inv = perm_inverse3 ( node_num, perm );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The RCM permutation and inverse:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : node_num
    fprintf ( 1, '  %6d  %6d  %6d\n', i, perm(i), perm_inv(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Permuted adjacency matrix:\n' );
  fprintf ( 1, '\n' );

  adj_perm_show ( node_num, adj_num, adj_row, adj, perm, perm_inv );

  bandwidth = adj_perm_bandwidth ( node_num, adj_num, adj_row, adj, ...
    perm, perm_inv );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ADJ (permuted) bandwidth = %d\n', bandwidth );

  return
end
