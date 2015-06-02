function treepack_test04 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST04 tests TREE_ARC_CENTER.
%
%  Discussion:
%
%    The tree is
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
  fprintf ( 1, 'TREEPACK_TEST04\n' );
  fprintf ( 1, '  TREE_ARC_CENTER computes the center of a tree.\n' );

  graph_arc_print ( nnode-1, inode, jnode, '  The edge list of the tree:' );

  [ center, eccent, parity ] = tree_arc_center ( nnode, inode, jnode );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Parity = %d\n', parity );
  fprintf ( 1, '  Eccentricity is %d\n', eccent );

  if ( parity == 0 )
    fprintf ( 1, '  No center node (degenerate case).\n' );
  elseif ( parity == 1 )
    fprintf ( 1, '  Center node: %d\n', center(1) );
  else
   fprintf ( 1, '  Center nodes: %d %d\n', center(1), center(2) );
  end

  return
end
