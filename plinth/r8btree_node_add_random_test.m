function r8btree_node_add_binary_test ( )

%*****************************************************************************80
%
%% R8BTREE_NODE_ADD_RANDOM_TEST adds random numbers to a BTREE.
%
%  Discussion:
%
%    Because the data is generated randomly, the tree will not be guaranteeed
%    to be well balanced.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BTREE_NODE_ADD_RANDOM_TEST\n' );
  fprintf ( 1, '  Use R8BTEE_NODE_ADD to build a BTREE,\n' );
  fprintf ( 1, '  by adding 33 random numbers, one at a time.\n' );
%
%  Initialize the BTREE.
%
  node_num = 0;
  tree = [];
  data_num = 2;
  tree_data = [];
%
%  Generate 33 nodes in [0,1];
%
  for i = 1 : 33

    x = rand ( );
    fx = x * x;
    node_data = [ x, fx ];

    [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
      data_num, tree_data, node_data );

  end
%
%  Print the BTREE.
%
  r8btree_print ( node_num, tree, data_num, tree_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BTREE_NODE_ADD_RANDOM_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
