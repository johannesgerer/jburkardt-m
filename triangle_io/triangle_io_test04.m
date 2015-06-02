function triangle_io_test04 ( )

%*****************************************************************************80
%
%% TRIANGLE_IO_TEST04 reads the example element data from a file.
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
  fprintf ( 1, 'TRIANGLE_IO_TEST04:\n' );
  fprintf ( 1, '  Read element data from an element file.\n' );
%
%  Get data size.
%
  [ element_num, element_order, element_att_num ] = ...
    triangle_element_size_read ( element_filename );
%
%  Print the sizes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element data read from file "%s"\n', element_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of elements = %d\n', element_num );
  fprintf ( 1, '  Element order = %d\n', element_order );
  fprintf ( 1, '  Number of element attributes = %d\n', element_att_num );
%
%  Get the data.
%
  [ element_node, element_att ] = triangle_element_data_read ( ...
    element_filename, element_num, element_order, element_att_num );
%
%  Print some of the data.
%
  i4mat_transpose_print_some ( element_order, element_num, element_node, ...
    1, 1, element_order, 10, '  Connectivity for first 10 elements:' );

  r8mat_transpose_print_some ( element_att_num, element_num, element_att, ...
    1, 1, element_att_num, 10, '  Attributes for first 10 elements:' );

  return
end
