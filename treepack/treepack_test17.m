function treepack_test17 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST17 tests TREE_ROOTED_ENUM.
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
  nnode = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST17\n' );
  fprintf ( 1, '  TREE_ROOTED_ENUM counts unlabeled rooted trees.\n' );

  ntree = tree_rooted_enum ( nnode );

  i4vec_print ( nnode, ntree, ...
    '  Number of trees with given number of nodes:' );

  return
end

