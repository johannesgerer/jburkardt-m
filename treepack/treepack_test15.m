function treepack_test15 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST15 tests TREE_ROOTED_CODE.
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
  fprintf ( 1, 'TREEPACK_TEST15\n' );
  fprintf ( 1, '  TREE_ROOTED_CODE: code of a rooted tree.\n' );
  fprintf ( 1, '\n' );

  i4vec_print ( nnode, parent, '  Parent vector for tree:' );

  code = tree_rooted_code ( nnode, parent );

  i4vec_print ( 2*nnode, code, '  The tree code:' );

  return
end

