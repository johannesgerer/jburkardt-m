function treepack_test08 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST08 tests TREE_ARC_RANDOM.
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
  nnode = 4;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST08\n' );
  fprintf ( 1, '  TREE_ARC_RANDOM produces a random labeled\n' );
  fprintf ( 1, '  tree and its Pruefer code.\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : 5

    [ icode, inode, jnode, seed ] = tree_arc_random ( nnode, seed );

    graph_arc_print ( nnode-1, inode, jnode, '  The random tree:' );

    i4vec_print ( nnode-2, icode, '  The Pruefer code:' );

  end
 
  return
end
