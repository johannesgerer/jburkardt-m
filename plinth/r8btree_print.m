function r8btree_print ( node_num, tree, data_num, tree_data )

%*****************************************************************************80
%
%% R8BTREE_PRINT prints a BTREE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the tree.
%
%    Input, integer TREE(4,NODE_NUM).
%    TREE(1,I), the index in TREE_DATA(1,*) of the coordinate of node I.
%    TREE(2,I), the left child of node I.
%    TREE(3,I), the right child of node I.
%    TREE(4,I), the parent of node I.
%
%    Input, integer DATA_NUM, the number of data items per node.
%
%    Input, real TREE_DATA(DATA_NUM,NODE_NUM), node data.
%

%
%  Print the pointers.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '       J       I    Left   Right  Parent\n' );
  fprintf ( 1, '\n' );
  for j = 1 : node_num
    fprintf ( 1, '  %6d  %6d  %6d  %6d  %6d\n', j, tree(1:4,j) );
  end
%
%  Print the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '       J   Tree data\n' );
  fprintf ( 1, '\n' );
  for j = 1 : node_num
    fprintf ( 1, '  %6d', j );
    for i = 1 : data_num
      fprintf ( 1, '  %10.4f', tree_data(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
