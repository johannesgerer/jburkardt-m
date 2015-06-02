function treepack_test11 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST11 tests TREE_RB_ENUM.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST11\n' );
  fprintf ( 1, '  TREE_RB_ENUM enumerates the rooted binary trees on a \n' );
  fprintf ( 1, '  given number of nodes.\n' );
  fprintf ( 1, '\n' );

  for nnode = 0 : 11

    num = tree_rb_enum ( nnode );

    fprintf ( 1, '  %8d  %8d\n', nnode, num );

  end
 
  return
end
