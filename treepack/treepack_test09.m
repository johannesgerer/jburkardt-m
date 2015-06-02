function treepack_test09 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST09 tests TREE_ENUM.
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
  fprintf ( 1, 'TREEPACK_TEST09\n' );
  fprintf ( 1, '  TREE_ENUM enumerates the labeled trees on a given\n' );
  fprintf ( 1, '  number of nodes.\n' );
  fprintf ( 1, '\n' );

  for nnode = 0 : 10

    num = tree_enum ( nnode );
    fprintf ( 1, '  %8d  %8d\n', nnode, num );

  end
 
  return
end
