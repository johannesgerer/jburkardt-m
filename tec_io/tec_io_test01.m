function tec_io_test01 ( )

%*****************************************************************************80
%
%% TEC_IO_TEST01 tests TEC_READ.
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
  tec_file_name = 'ell.dat';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_IO_TEST01\n' );
  fprintf ( 1, '  TEC_READ can read a TECPLOT ASCII file that contains\n' );
  fprintf ( 1, '  finite element data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we will read "%s".\n', tec_file_name );

  [ dim_num, node_num, element_num, element_order, node_data_num, ...
    node_coord, element_node, node_data ] = tec_read ( tec_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension         = %d\n', dim_num );
  fprintf ( 1, '  Number of nodes           = %d\n', node_num );
  fprintf ( 1, '  Number of elements        = %d\n', element_num );
  fprintf ( 1, '  Element order             = %d\n', element_order );
  fprintf ( 1, '  Number of node data items = %d\n', node_data_num );

  r8mat_transpose_print_some ( dim_num, node_num, node_coord, 1, 1, dim_num, 10, ...
    '  Coordinates of first 10 nodes:' );

  i4mat_transpose_print_some ( element_order, element_num, element_node, 1, 1, ...
    element_order, 10, '  Nodes of first 10 elements:' );

  r8mat_transpose_print_some ( node_data_num, node_num, node_data, 1, 1, ...
    node_data_num, 10, '  Node data for first 10 nodes:' );

  return
end
