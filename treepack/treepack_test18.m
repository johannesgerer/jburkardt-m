function treepack_test18 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST18 tests TREE_ROOTED_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
  nnode = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST18\n' );
  fprintf ( 1, '  TREE_ROOTED_RANDOM: random unlabeled rooted trees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Selecting random trees, rooted at 1\n' );
  fprintf ( 1, '  Number of nodes is NNODE = %d\n', nnode );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each tree is described by the nodes that\n' );
  fprintf ( 1, '  connect nodes 2 through NNODE.\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5

    [ ntree, itree, seed ] = tree_rooted_random ( nnode, seed );

    for j = 2 : nnode
      fprintf ( 1, '  %2d', itree(j) );
    end
    fprintf ( 1, '\n' );

  end
 
  return
end
