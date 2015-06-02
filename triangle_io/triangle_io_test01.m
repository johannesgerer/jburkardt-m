function triangle_io_test01 ( )

%*****************************************************************************80
%
%% TRIANGLE_IO_TEST01 gets the example node data and writes it to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
  node_filename = 'example.node';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_IO_TEST01:\n' );
  fprintf ( 1, '  Get example node data, write to a triangle node file.\n' );
%
%  Get node example size.
%
  [ node_num, node_dim, node_att_num, node_marker_num ] = ...
    triangle_node_size_example ( );
%
%  Print the sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );
  fprintf ( 1, '  Spatial dimension = %d\n', node_dim );
  fprintf ( 1, '  Number of node attributes = %d\n', node_att_num );
  fprintf ( 1, '  Number of node markers = %d\n', node_marker_num );
%
%  Get the node data.
%
  [ node_coord, node_att, node_marker ] = triangle_node_data_example ( ...
    node_num, node_dim, node_att_num, node_marker_num );
%
%  Print some of the data.
%
  r8mat_transpose_print_some ( node_dim, node_num, node_coord, ...
    1, 1, node_dim, 10, '  Coordinates for first 10 nodes:' );

  r8mat_transpose_print_some ( node_att_num, node_num, node_att, ...
    1, 1, node_att_num, 10, '  Attributes for first 10 nodes:' );

  i4mat_transpose_print_some ( node_marker_num, node_num, node_marker, ...
    1, 1, node_marker_num, 10, '  Markers for first 10 nodes:' );
%
%  Write the node information to node file.
%
  triangle_node_write ( node_filename, node_num, node_dim, node_att_num, ...
    node_marker_num, node_coord, node_att, node_marker );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node data written to file "%s"\n', node_filename );

  return
end
