function hex_grid_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests HEX_GRID_01_POINTS.
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
  test_num = 15;

  nodes_per_layer_test = [ ...
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 21, 41, 81, 101 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For a hexagonal grid of points in the unit square,\n' );
  fprintf ( 1, '  given NODES_PER_LAYER, the number of grid points\n' );
  fprintf ( 1, '  along the first layer,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HEX_GRID_01_POINTS computes P, the coordinates\n' );
  fprintf ( 1, '  of the points of the grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HEX_GRID_WRITE writes the data to a file.\n' );

  box(1:2,1:2) = [ 0.0, 0.0;
                   1.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '   NODES  LAYERS    N    Filename\n' );
  fprintf ( 1, '     PER\n' );
  fprintf ( 1, '   LAYER\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    nodes_per_layer = nodes_per_layer_test ( test );
    layers = hex_grid_01_layers ( nodes_per_layer );
    [ hx, hy ] = hex_grid_01_h ( nodes_per_layer );
    n = hex_grid_01_n ( nodes_per_layer );

    p = hex_grid_01_points ( nodes_per_layer, layers, n );

    file_name = ...
      strcat ( 'hex_grid_01_', num2str ( nodes_per_layer ), '_', ...
      num2str ( layers ), '_', num2str ( n ), '.txt' );

    file_name = s_blank_delete ( file_name );

    fprintf ( 1, '  %6d  %3d  %6d  %s\n', ...
      nodes_per_layer, layers, n, file_name );

    hex_grid_write ( n, nodes_per_layer, layers, hx, hy, box, ...
      p, file_name );

  end

  return
end
