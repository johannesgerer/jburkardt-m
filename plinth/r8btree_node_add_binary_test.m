function r8btree_node_add_binary_test ( )

%*****************************************************************************80
%
%% R8BTREE_NODE_ADD_BINARY_TEST adds binary fractions to a BTREE.
%
%  Discussion:
%
%    The data is added in the order:
%
%      1/2,  0, 1,
%      1/4,  3/4
%      1/8,  3/8,  5/8,  7/8
%      1/16, 3/16, 5/16, 7/16, 9/16, 11/16, 13/16, 15/16
%      1/32, 3/32, 5/32, 7/32, ...
%
%    This means the tree will be well balanced.
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
  fprintf ( 1, 'R8BTREE_NODE_ADD_BINARY_TEST\n' );
  fprintf ( 1, '  Use R8BTEE_NODE_ADD to build a BTREE,\n' );
  fprintf ( 1, '  by adding 33 binary fractions.\n' );
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
  for log_bottom = 1 : 5

    bottom = 2^log_bottom;

    for top = 1 : 2 : bottom - 1

      x = top / bottom;
      fx = x * x;
      node_data = [ x, fx ];

      [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
        data_num, tree_data, node_data );

    end

    if ( log_bottom == 1 )

      x = 0.0;
      fx = x * x;
      node_data = [ x, fx ];

      [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
        data_num, tree_data, node_data );

      x = 1.0;
      fx = x * x;
      node_data = [ x, fx ];

      [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
        data_num, tree_data, node_data );

    end

  end
%
%  Print the BTREE.
%
  r8btree_print ( node_num, tree, data_num, tree_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BTREE_NODE_ADD_BINARY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
