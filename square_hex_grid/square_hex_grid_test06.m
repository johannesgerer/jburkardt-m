function square_hex_grid_test06 ( )

%*****************************************************************************80
%
%% SQUARE_HEX_GRID_TEST06 tests HEX_GRID_01_APPROXIMATE_H.
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
  test_num = 3;

  h_goal_test = [ 0.10, 0.01, 0.0001 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_HEX_GRID_TEST06\n' );
  fprintf ( 1, '  For a hexagonal grid of points in the unit box,\n' );
  fprintf ( 1, '  HEX_GRID_01_APPROXIMATE_H seeks the value of\n' );
  fprintf ( 1, '  NODES_PER_LAYER that produces a mesh with spacing\n' );
  fprintf ( 1, '  that is H or less.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      H_GOAL      NODES_PER_LAYER      H                      N\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    h_goal = h_goal_test ( test );

    [ nodes_per_layer, h ] = hex_grid_01_approximate_h ( h_goal );

    n = hex_grid_01_n ( nodes_per_layer );

    fprintf ( 1, '  %14f           %6d  %14f  %12d\n', ...
      h_goal, nodes_per_layer, h, n );

  end

  return
end
