function treepack_test01 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST01 tests PRUEFER_TO_TREE_ARC.
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

  code = [ 1, 3, 8, 8, 3, 6, 8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST01\n' );
  fprintf ( 1, '  PRUEFER_TO_TREE_ARC computes a tree from its Pruefer code.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          5\n' );
  fprintf ( 1, '          |\n' );
  fprintf ( 1, '    2-3-6-8-1-9\n' );
  fprintf ( 1, '      |   |\n' );
  fprintf ( 1, '      7   4\n' );

  i4vec_print ( nnode-2, code, '  The Pruefer code:' );

  [ inode, jnode ] = pruefer_to_tree_arc ( nnode, code );
 
  graph_arc_print ( nnode-1, inode, jnode, '  The graph:' );

  return
end
