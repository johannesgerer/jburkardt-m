function treepack_test16 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST16 tests TREE_ROOTED_DEPTH.
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
  nnode = 12;

  parent = [ 0, 1, 1, 2, 2, 2, 3, 3, 5, 5, 6, 10 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST16\n' );
  fprintf ( 1, '  TREE_ROOTED_DEPTH: depth of a rooted tree.\n' );

  i4vec_print ( nnode, parent, '  Parent vector for tree:' );

  [ depth, depth_node ] = tree_rooted_depth ( nnode, parent );

  i4vec_print ( nnode, depth_node, '  Individual node depths:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Overall rooted tree depth: %d\n', depth );

  return
end

