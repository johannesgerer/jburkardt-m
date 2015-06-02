function triangle_element_write ( element_filename, element_num, element_order, ...
  element_att_num, element_node, element_att )

%*****************************************************************************80
%
%% TRIANGLE_ELEMENT_WRITE writes a TRIANGLE ".ele" file.
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
%  Parameters:
%
%    Input, string ELEMENT_FILENAME, the name of the file
%    to be written.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_ATT_NUM, the number of element 
%    attributes.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), 
%    the indices of the nodes that make up each element.
%
%    Input, real ELEMENT_ATT(ELEMENT_ATT_NUM,ELEMENT_NUM), 
%    the attributes of each element.
%
  output  = fopen ( element_filename, 'wt' );

  if ( output < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_ELEMENT_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_ELEMENT_WRITE - Fatal error!' );
  end

  fprintf ( output, '%d  %d  %d\n', ...
    element_num, element_order, element_att_num );

  for element = 1 : element_num

    fprintf ( output, '%d', element );

    for order = 1 : element_order
      fprintf ( output, '  %d', element_node(order,element) );
    end

    for att = 1 : element_att_num
      fprintf ( output, '  %g', element_att(att,element) );
    end

    fprintf ( output, '\n' );

  end

  fclose ( output );

  return
end
