function fem_io_test01 ( )

%*****************************************************************************80
%
%% FEM_IO_TEST01 tests FEM_READ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2006
%
%  Author:
%
%    John Burkardt
%
  node_coord_file_name = 'ell_nodes.txt';
  element_file_name = 'ell_elements.txt';
  node_data_file_name = 'ell_values.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_IO_TEST01\n' );
  fprintf ( 1, '  FEM_READ reads finite element data from files.\n' );

  fprintf ( 1, '\n' );

  fprintf ( 1, '  The node coordinate file name is "%s".\n', ...
    node_coord_file_name );
  fprintf ( 1, '  The element file name is "%s".\n', element_file_name );
  fprintf ( 1, '  The node data file name is "%s".\n', node_data_file_name );

  [ dim_num, node_num, element_num, element_order, node_data_num, ...
    node_coord, element_node, node_data ] = fem_read ( node_coord_file_name, ...
    element_file_name, node_data_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension =         %d\n', dim_num );
  fprintf ( 1, '  Number of nodes =           %d\n', node_num );
  fprintf ( 1, '  Element order =             %d\n', element_order );
  fprintf ( 1, '  Number of elements =        %d\n', element_num );
  fprintf ( 1, '  Number of node data items = %d\n', node_data_num );

  r8mat_transpose_print_some ( dim_num, node_num, node_coord, 1, 1, dim_num, ...
    10, '  First 10 node coordindates:' );

  i4mat_transpose_print_some ( element_order, element_num, ...
    element_node, 1, 1, element_order, 10, '  First 10 elements' );

  r8mat_transpose_print_some ( node_data_num, node_num, node_data, 1, 1, ...
    node_data_num, 10, '  First 10 node data sets:' );

  return
end
