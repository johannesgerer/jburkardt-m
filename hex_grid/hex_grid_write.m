function hex_grid_write ( n, nodes_per_layer, layers, hx, hy, box, r, ...
  file_out_name )

%*****************************************************************************80
%
%% HEX_GRID_WRITE writes a hex grid dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the M-dimensional
%    components of the next entry of the sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer NODES_PER_LAYER, the number of nodes in the first layer.
%
%    Input, integer LAYERS, the number of layers.
%
%    Input, real HX, HY, the row and column spacings.
%
%    Input, real BOX(2,2), the values of A, B, C and D
%    that define the coordinate box.
%
%    Input, real R(M,N), the points.
%
%    Input, string FILE_OUT_NAME, the name of the output file.
%
  m = 2;

  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEX_GRID_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'HEX_GRID_WRITE - Fatal error!' );
  end

  fprintf ( file_out_unit, '#  %s\n', file_out_name );
  fprintf ( file_out_unit, '#  created by HEX_GRID_WRITE.M\n' );
  fprintf ( file_out_unit, '#\n' );
  fprintf ( file_out_unit, '#  Spatial dimension M =     %12d\n', m );
  fprintf ( file_out_unit, '#  Number of points N =      %12d\n', n );
  fprintf ( file_out_unit, '#  NODES_PER_LAYER =         %12d\n', ...
    nodes_per_layer );
  fprintf ( file_out_unit, '#  Number of rows LAYERS =   %12d\n', layers );
  fprintf ( file_out_unit, '#  Coordinate box X(1) =     %12f\n', box(1,1) );
  fprintf ( file_out_unit, '#  Coordinate box X(2) =     %12f\n', box(1,2) );
  fprintf ( file_out_unit, '#  Coordinate box Y(1) =     %12f\n', box(2,1) );
  fprintf ( file_out_unit, '#  Coordinate box Y(2) =     %12f\n', box(2,2) );
  fprintf ( file_out_unit, '#  Node spacing HX =         %12f\n', hx );
  fprintf ( file_out_unit, '#  Layer spacing HY =        %12f\n', hy );
  fprintf ( file_out_unit, '#\n' );

  for j = 1 : n
    for i = 1 : m
      fprintf ( file_out_unit, '  %12f', r(i,j) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end
