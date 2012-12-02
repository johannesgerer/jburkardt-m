function hex_grid_dataset ( )

%*****************************************************************************80
%
%% HEX_GRID_DATASET generates a hexagonal grid dataset and writes it to a file.
%
%  Discussion:
%
%    This program is meant to be used interactively.  It's also
%    possible to prepare a simple input file beforehand and use it
%    in batch mode.
%
%    The program requests input values from the user:
%
%    * X1, Y1, the lower left corner of a bounding box.
%    * X2, Y2, the upper right corner of a bounding box.
%    * NODES_PER_LAYER, the number of nodes per layer.
%
%    The program will now define the dataset, and write it to a file.
%
%    The program will now request that you type "Y" if you want to 
%    set up another dataset.  Otherwise the program terminates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2005
%
%  Author:
%
%    John Burkardt
%
  ndim = 2;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEX_GRID_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Generate a hexagonal grid dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program is meant to be used interactively.\n' );
  fprintf ( 1, '  It is also possible to prepare a simple input \n' );
  fprintf ( 1, '  file beforehand and use it in batch mode.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * X1, Y1, the lower left corner of the region,\n' );
  fprintf ( 1, '  * X2, Y2, the upper right corner of the region,\n' );
  fprintf ( 1, '  * NODES_PER_LAYER, the number of nodes per layer,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program generates the data, writes it to the file\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    hex_grid_NPL_L_N.txt\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "NPL" is the number of nodes per layer,\n' );
  fprintf ( 1, '  "L" is the number of layers,\n' );
  fprintf ( 1, '  "N" is the number of nodes,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  After the dataset of nodes is computed, it is\n' );
  fprintf ( 1, '  written to a file, and another dataset may be made.\n' );
  fprintf ( 1, '\n' );

  while ( 1 ) 

    fprintf ( 1, '\n' );
    fprintf ( 1, '  ( X1, Y1 ) is the lower left corner of the region:.\n' );
    fprintf ( 1, '  (Try ''[0, 0]'' if you have no preference.)\n' );

    xy(1:2) = input ( '  Enter X1, Y1:  ' );

    if ( isempty ( xy ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HEX_GRID_DATASET\n' );
      fprintf ( 1, '  The empty input value of X1, Y1\n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end 

    box(1:ndim,1) = xy';

    fprintf ( 1, '  User input X1, Y1 = ( %f, %f ).\n', box(1:ndim,1) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  ( X2, Y2 ) is the upper right corner of the region:.\n' );
    fprintf ( 1, '  (Try ''[10, 10]'' if you have no preference.)\n' );
    fprintf ( 1, '  (Just press RETURN if you want to quit.)\n' );

    xy(1:2) = input ( '  Enter X2, Y2:  ' );

    if ( isempty ( xy ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HEX_GRID_DATASET\n' );
      fprintf ( 1, '  The empty input value of X2, Y2\n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end 

    box(1:ndim,2) = xy';

    fprintf ( 1, '  User input X2, Y2 = ( %f, %f ).\n', box(1:ndim,2) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  NODES_PER_LAYER is the number of nodes per layer.\n' );
    fprintf ( 1, '  (Try ''10'' if you have no preference.)\n' );
    fprintf ( 1, '  (Any value less than 1 terminates execution.\n' );
    fprintf ( 1, '  (Or just press RETURN if you want to quit.)\n' );

    nodes_per_layer = input ( '  Enter NODES_PER_LAYER:  ' );

    if ( isempty ( nodes_per_layer ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HEX_GRID_DATASET\n' );
      fprintf ( 1, '  The empty input value of NODES_PER_LAYER\n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end
    
    fprintf ( 1, '  User input NODES_PER_LAYER = %d\n', nodes_per_layer );

    if ( nodes_per_layer < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HEX_GRID_DATASET\n' );
      fprintf ( 1, '  The input value of NODES_PER_LAYER = %d\n', ...
        nodes_per_layer );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    layers = hex_grid_layers ( nodes_per_layer, box );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The number of layers will be %d.\n', layers );

    [ hx, hy ] = hex_grid_h ( nodes_per_layer, box );

    fprintf ( 1, '  The X spacing will be %d.\n', hx );
    fprintf ( 1, '  The Y spacing will be %d.\n', hy );

    n = hex_grid_n ( nodes_per_layer, box );

    fprintf ( 1, '  The number of nodes will be %d.\n', n );

    p = hex_grid_points ( nodes_per_layer, layers, n, box );

    file_out_name = ...
      strcat ( 'hex_grid_', num2str ( nodes_per_layer ), ...
        '_', num2str ( layers ), '_', num2str ( n ), '.txt' );

    hex_grid_write ( n, nodes_per_layer, layers, hx, hy, box, p, ...
      file_out_name );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The data was written to the file "%s".\n', ...
      file_out_name );

    fprintf ( 1, '\n' );
    c = input ( '  Enter "Y" if you want to define another dataset:' );

    if ( c ~= 'y' && c ~= 'Y' )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HEX_GRID_DATASET:\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break;
    end

  end 

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
