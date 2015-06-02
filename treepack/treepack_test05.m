function treepack_test05 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST05 tests TREE_ARC_CENTER.
%
%  Discussion:
%
%    Compare:
%
%    2--1--3
%
%    1--2--3
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
  nnode = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST05\n' );
  fprintf ( 1, '  TREE_ARC_CENTER computes the center of a tree.\n' );

  inode(1) = 1;
  inode(2) = 1;
  jnode(1) = 2;
  jnode(2) = 3;

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
    fprintf ( 1, '  Center nodes: %d  %d\n', center(1), center(2) );
  end

  inode(1) = 2;
  inode(2) = 2;
  jnode(1) = 1;
  jnode(2) = 3;

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
    fprintf ( 1, '  Center nodes: %d  %d\n', center(1), center(2) );
  end

  return
end
