function treepack_test025 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST025 tests PRUEFER_TO_TREE_2.
%
%  Discussion:
%
%    This example is used to illustrate the Nijenhuis and Wilf algorithm
%    LBLTRE.
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
  fprintf ( 1, 'TREEPACK_TEST025\n' );
  fprintf ( 1, '  PRUEFER_TO_TREE_2 produces a tree from its Pruefer code\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Code      Tree\n' );
  fprintf ( 1, '\n' );

  for j = 1 : nnode
    code(2) = j;
    for i = 1 : nnode
      code(1) = i;
      itree = pruefer_to_tree_2 ( nnode, code );
      fprintf ( 1, '  %2d  %2d    %2d  %2d  %2d\n', code(1:2), itree(1:3) );
    end
  end
 
  return
end
