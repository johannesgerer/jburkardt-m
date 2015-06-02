function triangle_io_test02 ( )

%*****************************************************************************80
%
%% TRIANGLE_IO_TEST02 gets the example element data and writes it to a file.
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
  element_filename = 'example.ele';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_IO_TEST02:\n' );
  fprintf ( 1, '  Get example element data, write to a triangle element file.\n' );
%
%  Get element example size.
%
  [ element_num, element_order, element_att_num ] = ...
    triangle_element_size_example ( );
%
%  Print the sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Order of elements = %d\n', element_order );
  fprintf ( 1, '  Number of element attributes = %d\n', element_att_num );
%
%  Get the data.
%
  [ element_node, element_att ] = triangle_element_data_example ( element_num, ...
    element_order, element_att_num );
%
%  Print some of the data.
%
  i4mat_transpose_print_some ( element_order, element_num, element_node, ...
    1, 1, element_order, 10, '  Node connectivity of first 10 elements:' );

  r8mat_transpose_print_some ( element_att_num, element_num, element_att, ...
    1, 1, element_att_num, 10, '  Attributes for first 10 elements:' ) ;
%
%  Write the node information to node file.
%
  triangle_element_write ( element_filename, element_num, element_order, ...
    element_att_num, element_node, element_att );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element data written to file "%s"\n', element_filename );

  return
end
