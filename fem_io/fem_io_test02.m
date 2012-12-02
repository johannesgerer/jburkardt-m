function fem_io_test02 ( )

%*****************************************************************************80
%
%% FEM_IO_TEST02 tests FEM_WRITE.
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
  dim_num = 2;
  node_num = 5;
  element_num = 3;
  element_order = 3;
  node_data_num = 2;

  node_coord = [ ...
    0.0, 0.0;
    1.0, 0.0;
    2.0, 0.0;
    0.0, 1.0;
    1.0, 1.0 ]';

  element_node = [ ...
    1, 2, 4; ...
    5, 4, 2; ...
    2, 3, 5 ]';

  node_data = [ ...
    1.0, 0.0; ...
    0.8, 0.2; ...
    0.6, 0.4; ...
    0.9, 0.1; ...
    0.5, 0.5 ]';
    
  node_coord_file_name = 'tiny_nodes.txt';
  element_file_name = 'tiny_elements.txt';
  node_data_file_name = 'tiny_values.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_IO_TEST02\n' );
  fprintf ( 1, '  Demonstrate the use of FEM_WRITE to write finite\n' );
  fprintf ( 1, '  element data to files.\n' );

  fprintf ( 1, '\n' );

  fprintf ( 1, '  The node coordinate file name is "%s".\n', ...
    node_coord_file_name );
  fprintf ( 1, '  The element file name is "%s".\n', element_file_name );
  fprintf ( 1, '  The node data file name is "%s".\n', node_data_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension =         %d\n', dim_num );
  fprintf ( 1, '  Number of nodes =           %d\n', node_num );
  fprintf ( 1, '  Element order =             %d\n', element_order );
  fprintf ( 1, '  Number of elements =        %d\n', element_num );
  fprintf ( 1, '  Number of node data items = %d\n', node_data_num );

  r8mat_transpose_print ( dim_num, node_num, node_coord, ...
    '  Node coordindates:' );

  i4mat_transpose_print ( element_order, element_num, ...
    element_node, '  Elements' );

  r8mat_transpose_print ( node_data_num, node_num, node_data, ...
    '  Node data sets:' );

  fem_write ( node_coord_file_name, element_file_name, ...
    node_data_file_name, dim_num, node_num, element_num, ...
    element_order, node_data_num, node_coord, element_node, node_data );

  return
end
