function [ node_num, node_dim, node_att_num, node_marker_num ] = ...
  triangle_node_size_read ( node_filename )

%*****************************************************************************80
%
%% TRIANGLE_NODE_SIZE_READ reads the header information from a node file.
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
%    Input, string NODE_FILENAME, the name of the node file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer NODE_DIM, the spatial dimension.
%
%    Output, integer NODE_ATT_NUM, number of node attributes 
%    listed on each node record.
%
%    Output, integer NODE_MARKER_NUM, 1 if every node record 
%    includes a final boundary marker value.
%
  input = fopen ( node_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_NODE_SIZE_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_NODE_SIZE_READ - Fatal error!' );
  end

  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_NODE_SIZE_READ - Fatal error!' );
    end

    if ( s_len_trim ( text ) == 0 )
      continue
    end

    if ( text(1) == '#' )
      continue
    end

    [ value, count ] = sscanf ( text, '%d%d%d%d' );

    if ( count < 4 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_NODE_SIZE_READ - Fatal error!\n' );
      fprintf ( 1, '  Header line did not have 4 value integers.\n' );
      error ( 'TRIANGLE_NODE_SIZE_READ - Fatal error!' );
    end

    node_num = value(1);
    node_dim = value(2);
    node_att_num = value(3);
    node_marker_num = value(4);

    break

  end

  fclose ( input );

  return
end
