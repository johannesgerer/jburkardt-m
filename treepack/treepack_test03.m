function treepack_test03 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST03 tests TREE_ARC_TO_PRUEFER.
%
%  Discussion:
%
%    The tree is
%
%          5
%          |
%    2-3-6-8-1-9
%      |   |
%      7   4
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
  fprintf ( 1, 'TREEPACK_TEST03\n' );
  fprintf ( 1, '  TREE_ARC_TO_PRUEFER: Tree => Pruefer code\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          5\n' );
  fprintf ( 1, '          |\n' );
  fprintf ( 1, '    2-3-6-8-1-9\n' );
  fprintf ( 1, '      |   |\n' );
  fprintf ( 1, '      7   4\n' );

  graph_arc_print ( nnode-1, inode, jnode, '  The graph:' );
 
  code = tree_arc_to_pruefer ( nnode, inode, jnode );

  i4vec_print ( nnode-2, code, '  The Pruefer code:' );
 
  return
end
