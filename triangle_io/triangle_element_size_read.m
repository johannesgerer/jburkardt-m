function [ element_num, element_order, element_att_num ] = ...
  triangle_element_size_read ( element_filename )

%*****************************************************************************80
%
%% TRIANGLE_ELEMENT_SIZE_READ reads the header information from an element file.
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
%    Input, string ELEMENT_FILENAME, the name of the 
%    element file.
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, integer ELEMENT_ORDER, the order of the elements.
%
%    Output, integer ELEMENT_ATT_NUM, the number of 
%    element attributes.
%
  input = fopen ( element_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end

    [ value, count ] = sscanf ( text, '%d%d%d%d' );

    if ( count < 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 3 value integers.\n' );
      error ( 'TRIANGLE_ELEMENT_SIZE_READ - Fatal error!' );
    end

    element_num = value(1);
    element_order = value(2);
    element_att_num = value(3);

    break

  end

  fclose ( input );

  return
end
