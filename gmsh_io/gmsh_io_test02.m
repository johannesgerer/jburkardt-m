function gmsh_io_test02 ( )

%*****************************************************************************80
%
%% GMSH_IO_TEST02 reads the example data from a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 October 2014
%
%  Author:
%
%   John Burkardt
%
  gmsh_filename = 'example_2d.msh';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GMSH_IO_TEST02:\n' );
  fprintf ( 1, '  Read data from a file.\n' );
%
%  Get the data size.
%
  [ node_num, m, element_num, element_order ] = ...
    gmsh_size_read ( gmsh_filename );
%
%  Print the sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node data read from file "%s"\n', gmsh_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );
  fprintf ( 1, '  Spatial dimension = %d\n', m );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Element order = %d\n', element_order );
%
%  Get the data.
%
  [ node_x, element_node ] = gmsh_data_read ( gmsh_filename, m, node_num, ...
    element_order, element_num );
%
%  Print some of the data.
%
  r8mat_transpose_print_some ( m, node_num, node_x, ...
    1, 1, m, 10, '  Coordinates for first 10 nodes:' );

  i4mat_transpose_print_some ( element_order, element_num, element_node, ...
    1, 1, element_order, 10, '  Connectivity for first 10 elements:' );

  return
end

