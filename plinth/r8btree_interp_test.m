function r8btree_interp_test ( )

%*****************************************************************************80
%
%% R8BTREE_INTERP_TEST demonstrates R8BTREE_INTERP.
%
%  Discussion:
%
%    We sample the function P77_FUN over the interval [0,2].
%
%    Then we compare interpolated to exact values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8BTREE_INTERP_TEST\n' );
  fprintf ( 1, '  Build a BTREE from sample values of a function.\n' );
  fprintf ( 1, '  Then compare exact to interpolated values.\n' );
%
%  Initialize the BTREE.
%
  node_num = 0;
  tree = [];
  data_num = 2;
  tree_data = [];
%
%  Generate 33 nodes in [0,2];
%
  for log_bottom = 1 : 5

    bottom = 2^log_bottom;

    for top = 1 : 2 : bottom - 1

      x = 2 * top / bottom;
      fx = p77_fun ( x );
      node_data = [ x, fx ];

      [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
        data_num, tree_data, node_data );

    end

    if ( log_bottom == 1 )

      x = 0.0;
      fx = p77_fun ( x );
      node_data = [ x, fx ];

      [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
        data_num, tree_data, node_data );

      x = 2.0;
      fx = p77_fun ( x );
      node_data = [ x, fx ];

      [ node_num, tree, tree_data ] = r8btree_node_add ( node_num, tree, ...
        data_num, tree_data, node_data );

    end

  end
%
%  Print the BTREE.
%
  r8btree_print_ordered ( node_num, tree, data_num, tree_data );
%
%  Do interpolation.
%
  int_num = 21;
  x = linspace ( 0.0, 2.0, int_num );
  fx = r8btree_interp ( node_num, tree, data_num, tree_data, int_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          Exact F    Interp F\n' );
  fprintf ( 1, '\n' );
  for i = 1 : int_num
    fprintf ( 1, '  %10f  %10f  %10f\n', x(i), p77_fun ( x(i) ), fx(i) );
  end

  return
end
