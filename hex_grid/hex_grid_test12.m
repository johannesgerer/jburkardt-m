function hex_grid_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests HEX_GRID_APPROXIMATE_H.
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

  h_goal_test = [ 0.1, 0.01, 0.0001 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  For a hexagonal grid of points in the unit box,\n' );
  fprintf ( 1, '  HEX_GRID_APPROXIMATE_H seeks the value of\n' );
  fprintf ( 1, '  NODES_PER_LAYER that produces a mesh with spacing\n' );
  fprintf ( 1, '  that is H or less.\n' );
  fprintf ( 1, '\n' );

  box(1:2,1:2) = [ 1.0, 2.0; ...
                   4.0, 7.0 ];

  box_print_2d ( box )

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      H_GOAL      NODES_PER_LAYER      H                      N\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    h_goal = h_goal_test ( test );

    [ nodes_per_layer, h ] = hex_grid_approximate_h ( box, h_goal );

    n = hex_grid_n ( nodes_per_layer, box );

    fprintf ( 1, '  %14f           %6d  %14f  %12d\n', ...
      h_goal, nodes_per_layer, h, n );

  end 

  return
end
