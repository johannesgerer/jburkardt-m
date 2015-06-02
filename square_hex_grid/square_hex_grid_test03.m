function square_hex_grid_test03 ( )

%*****************************************************************************80
%
%% SQUARE_HEX_GRID_TEST03 tests HEX_GRID_01_N.
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
  test_num = 17;

  nodes_per_layer_test = [ ...
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 21, 41, 81, 101, 1001, 10001 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_HEX_GRID_TEST03\n' );
  fprintf ( 1, '  For a hexagonal grid of points in the unit square,\n' );
  fprintf ( 1, '  given NODES_PER_LAYER, the number of grid points\n' );
  fprintf ( 1, '  along the first layer,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HEX_GRID_01_N computes N, the total number of grid\n' );
  fprintf ( 1, '  points in the unit square.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    NODES   LAYERS	     N\n' );
  fprintf ( 1, '      PER\n' );
  fprintf ( 1, '    LAYER\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    nodes_per_layer = nodes_per_layer_test ( test );

    layers = hex_grid_01_layers ( nodes_per_layer );

    n = hex_grid_01_n ( nodes_per_layer );

    fprintf ( 1, '  %6d  %6d  %12d\n', nodes_per_layer, layers, n );

  end

  return
end
