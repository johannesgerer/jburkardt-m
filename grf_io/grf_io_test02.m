function grf_io_test02 ( )

%*****************************************************************************80
%
%% GRF_IO_TEST02 tests GRF_HEADER_READ and GRF_DATA_READ.
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
  input_filename = 'coxeter.grf';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRF_IO_TEST02\n' );
  fprintf ( 1, '  GRF_HEADER_READ reads the header of a GRF file.\n' );
  fprintf ( 1, '  GRF_DATA_READ reads the data of a GRF file.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the GRF file "%s".\n', input_filename );

  [ node_num, edge_num ] = grf_header_read ( input_filename );

  grf_header_print ( node_num, edge_num );

  [ edge_pointer, edge_data, xy ] = grf_data_read ( input_filename, ...
    node_num, edge_num );

  grf_data_print ( node_num, edge_num, edge_pointer, edge_data, xy );

  return
end
