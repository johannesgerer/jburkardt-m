function treepack_test02 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST02 tests PRUEFER_TO_TREE_2.
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

  code = [ 1, 3, 8, 8, 3, 6, 8, 0, 0 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST02\n' );
  fprintf ( 1, '  PRUEFER_TO_TREE_2 produces a tree from its Pruefer code\n' );

  i4vec_print ( nnode-2, code, '  The Pruefer code:' );

  itree = pruefer_to_tree_2 ( nnode, code );
 
  i4vec_print ( nnode-1, itree, '  The edge list of the tree:' );
 
  return
end
