function [ node_coord, node_att, node_marker ] = triangle_node_data_read ( ...
  node_filename, node_num, node_dim, node_att_num, node_marker_num )

%*****************************************************************************80
%
%% TRIANGLE_NODE_DATA_READ reads the data from a node file.
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
% Parameters:
%
%   Input, string NODE_FILENAME, the name of the node file.
%
%   Input, integer NODE_NUM, the number of nodes.
%
%   Input, integer NODE_DIM, the spatial dimension.
%
%   Input, integer NODE_ATT_NUM, number of node attributes 
%   listed on each node record.
%
%   Input, integer NODE_MARKER_NUM, 1 if every node record 
%   includes a final boundary marker value.
%
%   Output, real NODE_COORD(NODE_DIM,NODE_NUM), the nodal 
%   coordinates.
%
%   Output, real NODE_ATT(NODE_ATT_NUM,NODE_NUM), the nodal 
%   attributes.
%
%   Output, integer NODE_MARKER(NODE_MARKER_NUM,NODE_NUM), the 
%   node markers.
%
  node = 0;

  input = fopen ( node_filename, 'rt' );

  if ( input < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_NODE_DATA_READ - Fatal error!\n' );
    fprintf ( 1, '  Unable to open file.\n' );
    error ( 'TRIANGLE_NODE_DATA_READ - Fatal error!' );
  end
%
%  Create format.
%
  format = '%d';
  for i = 1 : node_dim
    format = strcat ( format, '%g' );
  end
  for i = 1 : node_att_num
    format = strcat ( format, '%g' );
  end
  for i = 1 : node_marker_num
    format = strcat ( format, '%d' );
  end
%
%  Create arrays.
%
  node_coord = zeros ( node_dim, node_num );
  node_att = zeros ( node_att_num, node_num );
  node_marker = zeros ( node_marker_num, node_num );
%
%  Read values and place in the arrays.
%
  while ( 1 )

    text = fgets ( input );

    if ( text == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGLE_NODE_DATA_READ - Fatal error!\n' );
      fprintf ( 1, '  Unexpected end of file while reading.\n' );
      error ( 'TRIANGLE_NODE_DATA_READ - Fatal error!' );
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
    if ( node == 0 )

    else

      [ value, count ] = sscanf ( text, format );

      if ( count < 1 + node_dim + node_att_num + node_marker_num )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'TRIANGLE_NODE_DATA_READ - Fatal error!\n' );
        fprintf ( 1, '  Line did not have enough data.\n' );
        error ( 'TRIANGLE_NODE_DATA_READ - Fatal error!' );
      end

      j = 1;

      for i = 1 : node_dim
        j = j + 1;
        node_coord(i,node) = value(j);
      end

      for i = 1 : node_att_num
        j = j + 1;
        node_att(i,node) = value(j);
      end

      for i = 1 : node_marker_num
        j = j + 1;
        node_marker(i,node) = value(j);
      end

    end

    node = node + 1;

    if ( node_num < node )
      break
    end

  end

  fclose ( input );

  return
end

