function grf_write ( output_filename, node_num, edge_num, edge_pointer, ...
  edge_data, xy )

%*****************************************************************************80
%
%% GRF_WRITE writes a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the name of the file
%    to which the data should be written.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
%    Input, integer EDGE_POINTER(NODE_NUM+1), pointers to the
%    first edge item for each node.
%
%    Input, integer EDGE_DATA(EDGE_NUM), indices of adjacent nodes.
%
%    Input, real XY(2,NODE_NUM), the node coordinates.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRF_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_filename );
    error ( 'GRF_WRITE - Error!' );
  end
%
%  Write the header.
%
  if ( 0 )
    grf_header_write ( output_filename, output_unit, node_num, edge_num );
  end
%
%  Write the data.
%
  grf_data_write ( output_unit, node_num, edge_num, edge_pointer, ...
    edge_data, xy )
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
