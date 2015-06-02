function treepack_test12 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST12 tests TREE_RB_LEX_NEXT.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST12\n' );
  fprintf ( 1, '  TREE_RB_LEX_NEXT produces all rooted binary trees with\n' );
  fprintf ( 1, '  a given number of nodes, in lexicographic order, using\n' );
  fprintf ( 1, '  the preorder traversal representation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of nodes N = %d\n', n );
  fprintf ( 1, '\n' );

  more = 0;
  i = 0;
  a = [];

  while ( 1 )

    [ a, more ] = tree_rb_lex_next ( n, a, more );

    if ( ~ more )
      break
    end

    i = i + 1;
    fprintf ( 1, '  %2d  ', i );
    for j = 1 : n
      fprintf ( 1, '%d', a(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end

