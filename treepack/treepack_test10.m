function treepack_test10 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST10 tests TREE_PARENT_NEXT.
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
  nnode = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST10\n' );
  fprintf ( 1, '  TREE_PARENT_NEXT finds all labeled trees of a given \n' );
  fprintf ( 1, '  order, and their Pruefer codes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pruefer code     Tree\n' );
  fprintf ( 1, '\n' );
 
  more = 0;
 
  while ( 1 )
 
    [ icode, itree, more ] = tree_parent_next ( nnode, more );
 
    fprintf ( 1, '  ' );
    for i = 1 : nnode - 2
      fprintf ( 1, '%2d', icode(i) );
    end
    fprintf ( 1, '              ' );
    for i = 1 : nnode - 1
      fprintf ( 1, '%2d', itree(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~ more )
      break
    end

  end
 
  return
end
