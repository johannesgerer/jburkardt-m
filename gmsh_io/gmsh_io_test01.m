function gmsh_io_test01 ( )

%*****************************************************************************80
%
%% GMSH_IO_TEST01 gets the example 2D data and writes it to a file.
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
%    John Burkardt
%
  gmsh_filename = 'example_2d.msh';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GMSH_IO_TEST01:\n' );
  fprintf ( 1, '  Get example 2D data, write to a file.\n' );
%
%  Get sizes.
%
  [ node_num, m ] = gmsh_mesh2d_node_size_example ( );

  [ element_num, element_order ] = gmsh_mesh2d_element_size_example ( );
%
%  Print the sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );
  fprintf ( 1, '  Spatial dimension = %d\n', m );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Order of elements = %d\n', element_order );
%
%  Get the data.
%
  node_x = gmsh_mesh2d_node_data_example ( node_num, m );

  element_node = gmsh_mesh2d_element_data_example ( element_num, ...
    element_order );
%
%  Print some of the data.
%
  r8mat_transpose_print_some ( m, node_num, node_x, ...
    1, 1, m, 10, '  Coordinates for first 10 nodes:' );

  i4mat_transpose_print_some ( element_order, element_num, element_node, ...
    1, 1, element_order, 10, '  Node connectivity of first 10 elements:' );
%
%  Write the GMSH file.
%
  gmsh_mesh2d_write ( gmsh_filename, m, node_num, node_x, ...
    element_order, element_num, element_node )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote example data to file "%s"\n', gmsh_filename );

  return
end
