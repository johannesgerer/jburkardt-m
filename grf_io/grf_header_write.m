function grf_header_write ( output_filename, output_unit, node_num, edge_num )

%*****************************************************************************80
%
%% GRF_HEADER_WRITE writes the header of a GRF file.
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
%    Input, string OUTPUT_FILENAME, the name of the output file.
%
%    Input, integer OUTPUT_UNIT, the output file unit number.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
  string = timestring ( );
%
%  Write the header.
%
  fprintf ( output_unit, '#  %s\n', output_filename );
  fprintf ( output_unit, '#  created by grf_io::grf_header_write.m\n' );
  fprintf ( output_unit, '#  on %s\n', string );
  fprintf ( output_unit, '#\n' );
  fprintf ( output_unit, '#  Number of nodes  = ', node_num );
  fprintf ( output_unit, '#  Number of edges =  ', edge_num );
  fprintf ( output_unit, '#\n' );

  return
end
