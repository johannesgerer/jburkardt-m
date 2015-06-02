function square_hex_grid_test08 ( )

%*****************************************************************************80
%
%% SQUARE_HEX_GRID_TEST08 tests HEX_GRID_H.
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
  fprintf ( 1, 'SQUARE_HEX_GRID_TEST08\n' );
  fprintf ( 1, '  For a hexagonal grid of points in a coordinate box,\n' );
  fprintf ( 1, '  given NODES_PER_LAYER, the number of grid points\n' );
  fprintf ( 1, '  along the first layer,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HEX_GRID_H computes HX and HY, the spacings\n' );
  fprintf ( 1, '  in the row and column directions.\n' );

  box(1:2,1:2) = [ 1.0, 2.0; ...
                   4.0, 7.0 ];

  box_print_2d ( box );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    NODES    LAYERS   HX          HY\n' );
  fprintf ( 1, '      PER\n' );
  fprintf ( 1, '    LAYER\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    nodes_per_layer = nodes_per_layer_test ( test );
    layers = hex_grid_layers ( nodes_per_layer, box );
    [ hx, hy ] = hex_grid_h ( nodes_per_layer, box );
    fprintf ( 1, '  %6d  %6d  %10f  %10f\n',...
      nodes_per_layer, layers, hx, hy );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LAYERS is chosen so that LAYERS-1 layers just fit\n' );
  fprintf ( 1, '  inside the unit square, but LAYERS layers do not.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LAYERS      HY     (LAYERS-1)*HY    LAYERS*HY\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    nodes_per_layer = nodes_per_layer_test ( test );
    layers = hex_grid_layers ( nodes_per_layer, box );
    [ hx, hy ] = hex_grid_h ( nodes_per_layer, box );

    temp1 = ( layers - 1 ) * hy;
    temp2 = ( layers ) * hy;

    fprintf ( 1, '  %6d  %10f  %10f  %10f\n', layers, hy, temp1, temp2 );

  end

  return
end
