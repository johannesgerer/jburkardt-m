function treepack_test06 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST06 tests TREE_ARC_CENTER.
%
%  Discussion:
%
%    The tree is
%
%     1-----2-----3
%    /|\   / \   /|\
%   4 5 6 8  10 7 9 11
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
  nnode = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST06\n' );
  fprintf ( 1, '  TREE_ARC_CENTER computes the center of a tree.\n' );

  inode(1) = 1;
  jnode(1) = 4;
  inode(2) = 1;
  jnode(2) = 5;
  inode(3) = 1;
  jnode(3) = 6;

  inode(4) = 2;
  jnode(4) = 8;
  inode(5) = 2;
  jnode(5) = 10;

  inode(6) = 3;
  jnode(6) = 7;
  inode(7) = 3;
  jnode(7) = 9;
  inode(8) = 3;
  jnode(8) = 11;

  inode(9) = 1;
  jnode(9) = 2;
  inode(10) = 2;
  jnode(10) = 3;

  graph_arc_print ( nnode-1, inode, jnode, '  The edge list of the tree:' )

  [ center, eccent, parity ] = tree_arc_center ( nnode, inode, jnode );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Parity = %d\n', parity );
  fprintf ( 1, '  Eccentricity is %d\n', eccent );

  if ( parity == 0 )
    fprintf ( 1, '  No center node (degenerate case).\n' );
  elseif ( parity == 1 )
    fprintf ( 1, '  Center node: %d\n', center(1) );
  else
    fprintf ( 1, '  Center nodes: %d  %d\n', center(1), center(2) );
  end

  return
end
