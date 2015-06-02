function treepack_test07 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST07 tests TREE_ARC_DIAM.
%
%  Discussion:
%
%    The tree is:
%
%    2---3---6---8---1---9
%       /       / \
%      7       5   4
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
  nnode = 9;

  inode = [ 2, 3, 3, 6, 8, 8, 8, 1 ];
  jnode = [ 3, 7, 6, 8, 4, 5, 1, 9 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST07\n' );
  fprintf ( 1, '  TREE_ARC_DIAM computes the diameter of a tree.\n' );

  graph_arc_print ( nnode-1, inode, jnode, '  The edge list of the tree:' );

  [ diam, label, nnode1, nnode2 ] = tree_arc_diam ( nnode, inode, jnode );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This tree has a diameter of %d\n', diam );
  fprintf ( 1, '  between nodes %d and %d\n', nnode1, nnode2 );

  i4vec_print ( nnode, label, '  Nodes and labels:' );

  return
end
