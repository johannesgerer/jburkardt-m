function r8btree_interp_level_test ( )

%*****************************************************************************80
%
%% R8BTREE_INTERP_LEVEL_TEST demonstrates R8BTREE_INTERP_LEVEL.
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
  fprintf ( 1, 'R8BTREE_INTERP_LEVEL_TEST\n' );
  fprintf ( 1, '  Build a BTREE from sample values of a function.\n' );
  fprintf ( 1, '  Then compare exact to interpolated values.\n' );
  fprintf ( 1, '  The interpolation may be restricted to search only\n' );
  fprintf ( 1, '  the first LEVEL levels of the BTREE.\n' );
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

  clf 
  x1 = linspace ( -0.5, 2.5, 500 );
  fx1 = p77_fun ( x1 );
  plot ( x1, fx1, 'g-', 'LineWidth', 2 );
  title ( 'Function to interpolate' );
  xlabel ( 'X' );
  ylabel ( 'Y(X)' );
  hold on

  for level = 0 : 5

    pause 

    if ( 0 < level )
      plot ( x2, fx2, 'w-', 'LineWidth', 2 )
      plot ( x1, fx1, 'g-', 'LineWidth', 2 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using LEVEL = %d\n', level );
    fprintf ( 1, '\n' );
%
%  Do interpolation up to level LEVEL.
%
    int_num = 41;
    x2 = linspace ( -0.5, 2.5, int_num );
    fx2 = r8btree_interp_level ( node_num, tree, data_num, tree_data, int_num, ...
      x2, level );

    fprintf ( 1, '\n' );
    fprintf ( 1, '      X          Exact F    Interp F\n' );
    fprintf ( 1, '\n' );
    for i = 1 : int_num
      fprintf ( 1, '  %10f  %10f  %10f\n', x2(i), p77_fun ( x2(i) ), fx2(i) );
    end

    plot ( x2, fx2, 'r-', 'LineWidth', 2 )
    title_string = sprintf ( 'Interpolant for level %d', level );
    title ( title_string );

  end

  hold off

  return
end
