function grf_io_test01 ( )

%*****************************************************************************80
%
%% GRF_IO_TEST01 tests GRF_HEADER_WRITE and GRF_DATA_WRITE.
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
  output_filename = 'coxeter.grf';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRF_IO_TEST01\n' );
  fprintf ( 1, '  GRF_HEADER_WRITE writes the header of a GRF file.\n' );
  fprintf ( 1, '  GRF_DATAWRITE writes the data of a GRF file.\n' );

  [ node_num, edge_num ] = grf_example_size ( );

  grf_header_print ( node_num, edge_num )

  [ edge_pointer, edge_data, xy ] = grf_example ( node_num, edge_num );

  grf_write ( output_filename, node_num, edge_num, edge_pointer, ...
    edge_data, xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the GRF file "%s".\n', output_filename );

  return
end
