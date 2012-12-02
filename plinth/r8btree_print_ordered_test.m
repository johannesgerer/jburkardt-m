function r8btree_print_ordered_test ( )

%*****************************************************************************80
%
%% R8BTREE_PRINT_ORDERED_TEST tests R8BTREE_PRINT_ORDERED.
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
  fprintf ( 1, 'R8BTREE_PRINT_ORDERED_TEST\n' );
  fprintf ( 1, '  R8BTREE_PRINT_ORDERED prints the pointers and data \n' );
  fprintf ( 1, '  of a BTREE, ordered by the first data item.\n' );
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

      x = [ top / bottom ];
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
  r8btree_print_ordered ( node_num, tree, data_num, tree_data );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BTREE_PRINT_ORDERED_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
