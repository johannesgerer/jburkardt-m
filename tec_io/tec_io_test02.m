function tec_io_test02 ( )

%*****************************************************************************80
%
%% TEC_IO_TEST02 tests TEC_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2006
%
%  Author:
%
%    John Burkardt
%
  tec_file_name = 'tiny.dat';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_IO_TEST02\n' );
  fprintf ( 1, '  TEC_WRITE can write finite element data to a TECPLOT ASCII file.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we will write data to "%s".\n', tec_file_name );

  dim_num = 2;
  node_num = 5;
  element_num = 3;
  element_order = 3;
  node_data_num = 2;
  node_coord = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    2.0, 0.0; ...
    0.0, 1.0; ...
    1.0, 1.0 ]';
  element_node = [ ...
    1, 2, 4;
    5, 4, 2;
    2, 3, 5 ]';
  node_data = [ ...
    1.0, 0.0; ...
    0.8, 0.2; ...
    0.6, 0.4; ...
    0.9, 0.1; ...
    0.5, 0.5 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension         = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes           = %d\n', node_num );
  fprintf ( 1, '  Number of elements        = %d\n', element_num );
  fprintf ( 1, '  Element order             = %d\n', element_order );
  fprintf ( 1, '  Number of node data items = %d\n', node_data_num );

  r8mat_transpose_print ( dim_num, node_num, node_coord, ...
    '  Coordinates of nodes:' );

  i4mat_transpose_print ( element_order, element_num, element_node, ...
    '  Nodes of elements:' );

  r8mat_transpose_print ( node_data_num, node_num, node_data, ...
    '  Node data for nodes:' );

  tec_write ( tec_file_name, dim_num, node_num, element_num, ...
    element_order, node_data_num, node_coord, element_node, node_data );

  return
end
