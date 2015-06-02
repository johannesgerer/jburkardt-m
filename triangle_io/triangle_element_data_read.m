function [ element_node, element_att ] = triangle_element_data_read ( ...
  element_filename, element_num, element_order, element_att_num )

%*****************************************************************************80
%
%% TRIANGLE_ELEMENT_DATA_READ reads the data from an element file.
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
%    Input, string ELEMENT_FILENAME, the name of the file.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer ELEMENT_ATT_NUM, number of element attributes 
%    listed on each node record.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), 
%    the indices of the nodes that make up each element.
%
%    Output, real ELEMENT_ATT(ELEMENT_ATT_NUM,ELEMENT_NUM), the 
%    attributes of each element.
%
  element = 0;

  input = fopen ( element_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!' );
  end
%
%  Create format.
%
  format = '%d';
  for i = 1 : element_order
    format = strcat ( format, '%d' );
  end
  for i = 1 : element_att_num
    format = strcat ( format, '%g' );
  end
%
%  Create arrays.
%
  element_node = zeros ( element_order, element_num );
  element_att = zeros ( element_att_num, element_num );
%
%  Read values and place in the arrays.
%
  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ELEMENT_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'ELEMENT_DATA_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end
%
%  Ignore the dimension line.
%
    if ( element == 0 )

    else

      [ value, count ] = sscanf ( text, format );

      if ( count < 1 + element_order + element_att_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'TRIANGLE_ELEMENT_DATA_READ - Fatal error!' );
      end

      j = 1;

      for i = 1 : element_order
        j = j + 1;
        element_node(i,element) = value(j);
      end

      for i = 1 : element_att_num
        element_att(i,element) = value(j);
      end

    end

    element = element + 1;

    if ( element_num < element )
      break
    end

  end

  fclose ( input );

  return
end
