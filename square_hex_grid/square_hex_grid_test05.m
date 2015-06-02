function square_hex_grid_test05 ( )

%*****************************************************************************80
%
%% SQUARE_HEX_GRID_TEST05 tests HEX_GRID_01_APPROXIMATE_N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 4

  n_goal_test = [ 100, 200, 500, 10000 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_HEX_GRID_TEST05\n' );
  fprintf ( 1, '  For a hexagonal grid of points in the unit box,\n' );
  fprintf ( 1, '  HEX_GRID_01_APPROXIMATE_N seeks the value of\n' );
  fprintf ( 1, '  NODES_PER_LAYER that produces a mesh of about N points.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N_GOAL  NODES_PER_LAYER       N\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    n_goal = n_goal_test ( test );

    [ nodes_per_layer, n ] = hex_grid_01_approximate_n ( n_goal );

    fprintf ( 1, '  %6d           %6d  %6d\n', n_goal, nodes_per_layer, n );

  end

  return
end
